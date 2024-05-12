import API

import Foundation
import SwiftAtproto
import SwiftCbor

public struct MessageHeader: Codable, Equatable {
    public let op: UInt8
    public let t: String
}

public struct RepoMessage: Codable {
    public let header: MessageHeader
    public let commit: comatprototypes.SyncSubscribeRepos_Commit

    public init(from decoder: any Decoder) throws {
        var container = try decoder.unkeyedContainer()
        header = try container.decode(MessageHeader.self)
        commit = try container.decode(comatprototypes.SyncSubscribeRepos_Commit.self)
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(header)
        try container.encode(commit)
    }
}

enum CarError: Error {
    case unexpectedEOF
    case overflow
}

public struct Block {
    public let cid: LexLink
    public let data: Data
}

public class CarReader {
    let stream: InputStream
    let header: CarHeader

    public init(stream: InputStream) throws {
        self.stream = stream
        header = try Self.readHeader(stream: stream)
    }

    func next() throws -> Block {
        let (cid, data) = try Self.readNode(stream: stream)
        return Block(cid: cid, data: data)
    }

    public func readAll() throws -> [Block] {
        var blocks = [Block]()
        repeat {
            try blocks.append(next())
        } while stream.hasBytesAvailable
        return blocks
    }

    private static let maxVarintLen64 = 10
    public static func readUvarint(stream: InputStream) throws -> UInt64 {
        var x: UInt64 = 0
        var s: UInt = 0
        var i = 0
        while i < Self.maxVarintLen64 {
            guard let b = try ([UInt8](unsafeUninitializedCapacity: 1) { buf, initializedCount in
                let bytesRead = stream.read(buf.baseAddress!, maxLength: buf.count)
                initializedCount = bytesRead
                guard bytesRead >= 0 else {
                    throw stream.streamError!
                }
            }).first else { throw CarError.unexpectedEOF }
            if b < 0x80 {
                if i == Self.maxVarintLen64 - 1 && b > 1 {
                    throw CarError.overflow
                }
                return x | UInt64(b) << s
            }
            x |= UInt64(b & 0x7F) << s
            s += 7
            i += 1
        }
        throw CarError.overflow
    }

    static func ldRead(stream: InputStream) throws -> Data {
        let n = try Self.readUvarint(stream: stream)
        let bytes = try [UInt8](unsafeUninitializedCapacity: Int(n)) { buf, initializedCount in
            let bytesRead = stream.read(buf.baseAddress!, maxLength: buf.count)
            initializedCount = bytesRead
            guard bytesRead >= 0 else {
                throw stream.streamError!
            }
        }
        return Data(bytes)
    }

    static func readHeader(stream: InputStream) throws -> CarHeader {
        let hb = try Self.ldRead(stream: stream)
        let decoder = CborDecoder()
        return try decoder.decode(CarHeader.self, from: hb)
    }

    static func readNode(stream: InputStream) throws -> (LexLink, Data) {
        let data = try Self.ldRead(stream: stream)
        let ss = InputStream(data: data)
        ss.open()
        let version = try CarReader.readUvarint(stream: ss)
        assert(version == 1)
        _ = try CarReader.readUvarint(stream: ss)
        _ = try CarReader.readUvarint(stream: ss)
        let mhl = try CarReader.readUvarint(stream: ss)
        let cidLength = mhl + 4
        let cid = try LexLink(data[..<cidLength])
        return (cid, Data(data[cidLength...]))
    }
}

extension LexLink: CborCodable {
    public var tag: UInt64 {
        42
    }
}

public struct CarHeader: Codable {
    let roots: [LexLink]
    let version: UInt64
}

public struct NodeData: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case left = "l"
        case entries = "e"
    }

    let left: LexLink?
    let entries: [TreeEntry]
}

public struct TreeEntry: Codable, Equatable {
    private enum CodingKeys: String, CodingKey {
        case prefixLen = "p"
        case keySuffix = "k"
        case value = "v"
        case tree = "t"
    }

    let prefixLen: Int
    let keySuffix: Data
    let value: LexLink
    let tree: LexLink?
}
