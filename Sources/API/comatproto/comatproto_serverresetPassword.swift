//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ServerResetPassword_Input: Codable {
        public var password: String
        public var token: String

        public init(password: String, token: String) {
            self.password = password
            self.token = token
        }

        enum CodingKeys: String, CodingKey {
            case password
            case token
        }
    }

    public enum ServerResetPassword_Error: XRPCError {
        case expiredtoken(String?)
        case invalidtoken(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "ExpiredToken":
                self = .expiredtoken(error.message)
            case "InvalidToken":
                self = .invalidtoken(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .expiredtoken:
                return "ExpiredToken"
            case .invalidtoken:
                return "InvalidToken"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .expiredtoken(message):
                return message
            case let .invalidtoken(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func ServerResetPassword(client: any XRPCClientProtocol, input: ServerResetPassword_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.server.resetPassword", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw ServerResetPassword_Error(error: error)
        }
    }
}