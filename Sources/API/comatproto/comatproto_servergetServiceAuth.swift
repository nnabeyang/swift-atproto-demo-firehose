//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ServerGetServiceAuth_Output: Codable {
        public var token: String

        public init(token: String) {
            self.token = token
        }

        enum CodingKeys: String, CodingKey {
            case token
        }
    }

    public enum ServerGetServiceAuth_Error: XRPCError {
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

    public static func ServerGetServiceAuth(client: any XRPCClientProtocol, aud: String) async throws -> ServerGetServiceAuth_Output {
        let params: Parameters = ["aud": .string(aud)]
        do {
            return try await client.fetch(endpoint: "com.atproto.server.getServiceAuth", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw ServerGetServiceAuth_Error(error: error)
        }
    }
}
