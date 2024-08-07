import API
import Foundation
import HummingbirdWSClient
import SwiftAtproto
import SwiftCbor

public enum Firehose {
  public static func main(url: String) async throws {
    _ = XRPCClient.shared
    let decoder = CborDecoder()
    let jsonEncoder = JSONEncoder()
    jsonEncoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
    try await WebSocketClient.connect(url: .init(url),
                                      configuration: .init(maxFrameSize: 1 << 17),
                                      logger: .init(label: "Firehose"))
    { inbound, _, _ in
      for try await msg in inbound.messages(maxSize: .max) {
        switch msg {
        case .text:
          fatalError()
        case var .binary(buffer):
          let n = buffer.readableBytes
          guard var data = buffer.readData(length: n) else { continue }
          data.insert(0x82, at: 0)
          let message = try decoder.decode(RepoMessage.self, from: data)
          if message.header.op != 1 {
            continue
          }
          switch message.value {
          case let .commit(commit):
            let stream = InputStream(data: commit.blocks)
            stream.open()
            let reader = try CarReader(stream: stream)
            let blocks = try reader.readAll()
            for op in commit.ops {
              guard let cid = op.cid,
                    let block = blocks.first(where: { block in
                      block.cid == cid
                    })
              else {
                continue
              }

              let record = try decoder.decode(LexiconTypeDecoder.self, from: block.data)
              let json = try String(decoding: jsonEncoder.encode(record), as: UTF8.self)
              print(json)
            }
          case let .identity(value):
            let json = try String(decoding: jsonEncoder.encode(value), as: UTF8.self)
            print(json)
          case let .account(value):
            let json = try String(decoding: jsonEncoder.encode(value), as: UTF8.self)
            print(json)
          case let .handle(value):
            let json = try String(decoding: jsonEncoder.encode(value), as: UTF8.self)
            print(json)
          case let .info(value):
            let json = try String(decoding: jsonEncoder.encode(value), as: UTF8.self)
            print(json)
          case let .migrate(value):
            let json = try String(decoding: jsonEncoder.encode(value), as: UTF8.self)
            print(json)
          case let .tombstone(value):
            let json = try String(decoding: jsonEncoder.encode(value), as: UTF8.self)
            print(json)
          case let .labels(value):
            let json = try String(decoding: jsonEncoder.encode(value), as: UTF8.self)
            print(json)
          }
        }
      }
    }
  }
}
