//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ServerRequestEmailUpdate_Output: Codable {
        public var tokenRequired: Bool

        public init(tokenRequired: Bool) {
            self.tokenRequired = tokenRequired
        }

        enum CodingKeys: String, CodingKey {
            case tokenRequired
        }
    }

    public enum ServerRequestEmailUpdate_Error: XRPCError {
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

    public static func ServerRequestEmailUpdate(client: any XRPCClientProtocol) async throws -> ServerRequestEmailUpdate_Output {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.server.requestEmailUpdate", contentType: "*/*", httpMethod: .post, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw ServerRequestEmailUpdate_Error(error: error)
        }
    }
}
