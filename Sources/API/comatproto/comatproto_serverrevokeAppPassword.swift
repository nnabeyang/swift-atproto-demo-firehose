//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ServerRevokeAppPassword_Input: Codable {
        public var name: String

        public init(name: String) {
            self.name = name
        }

        enum CodingKeys: String, CodingKey {
            case name
        }
    }

    public enum ServerRevokeAppPassword_Error: XRPCError {
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

    public static func ServerRevokeAppPassword(client: any XRPCClientProtocol, input: ServerRevokeAppPassword_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.server.revokeAppPassword", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw ServerRevokeAppPassword_Error(error: error)
        }
    }
}