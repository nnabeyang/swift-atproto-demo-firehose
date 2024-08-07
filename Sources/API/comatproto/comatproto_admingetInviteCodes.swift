//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class AdminGetInviteCodes_Output: Codable {
        public var codes: [ServerDefs_InviteCode]
        public var cursor: String?

        public init(codes: [ServerDefs_InviteCode], cursor: String?) {
            self.codes = codes
            self.cursor = cursor
        }

        enum CodingKeys: String, CodingKey {
            case codes
            case cursor
        }
    }

    public enum AdminGetInviteCodes_Sort: RawRepresentable, Codable {
        public typealias RawValue = String

        case recent
        case usage
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "recent":
                self = .recent
            case "usage":
                self = .usage
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .recent:
                "recent"
            case .usage:
                "usage"
            case let .unknown(value):
                value
            }
        }

        public init(from decoder: any Decoder) throws {
            let rawValue = try String(from: decoder)
            self = Self (rawValue: rawValue)!
        }

        public func encode(to encoder: any Encoder) throws {
            try rawValue.encode(to: encoder)
        }
    }

    public enum AdminGetInviteCodes_Error: XRPCError {
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func AdminGetInviteCodes(client: any XRPCClientProtocol, cursor: String?, limit: Int?, sort: AdminGetInviteCodes_Sort?) async throws -> AdminGetInviteCodes_Output {
        let params: Parameters = ["cursor": .string(cursor), "limit": .integer(limit), "sort": .string(sort?.rawValue)]
        do {
            return try await client.fetch(endpoint: "com.atproto.admin.getInviteCodes", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw AdminGetInviteCodes_Error(error: error)
        }
    }
}
