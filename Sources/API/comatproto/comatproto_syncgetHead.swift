//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class SyncGetHead_Output: Codable {
        public var root: String

        public init(root: String) {
            self.root = root
        }

        enum CodingKeys: String, CodingKey {
            case root
        }
    }

    public enum SyncGetHead_Error: XRPCError {
        case headnotfound(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "HeadNotFound":
                self = .headnotfound(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .headnotfound:
                return "HeadNotFound"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .headnotfound(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func SyncGetHead(client: any XRPCClientProtocol, did: String) async throws -> SyncGetHead_Output {
        let params: Parameters = ["did": .string(did)]
        do {
            return try await client.fetch(endpoint: "com.atproto.sync.getHead", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw SyncGetHead_Error(error: error)
        }
    }
}
