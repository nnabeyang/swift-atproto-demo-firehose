//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ServerConfirmEmail_Input: Codable {
        public var email: String
        public var token: String

        public init(email: String, token: String) {
            self.email = email
            self.token = token
        }

        enum CodingKeys: String, CodingKey {
            case email
            case token
        }
    }

    public enum ServerConfirmEmail_Error: XRPCError {
        case accountnotfound(String?)
        case expiredtoken(String?)
        case invalidemail(String?)
        case invalidtoken(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "AccountNotFound":
                self = .accountnotfound(error.message)
            case "ExpiredToken":
                self = .expiredtoken(error.message)
            case "InvalidToken":
                self = .invalidtoken(error.message)
            case "InvalidEmail":
                self = .invalidemail(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .accountnotfound:
                return "AccountNotFound"
            case .expiredtoken:
                return "ExpiredToken"
            case .invalidtoken:
                return "InvalidToken"
            case .invalidemail:
                return "InvalidEmail"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .accountnotfound(message):
                return message
            case let .expiredtoken(message):
                return message
            case let .invalidtoken(message):
                return message
            case let .invalidemail(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func ServerConfirmEmail(client: any XRPCClientProtocol, input: ServerConfirmEmail_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.server.confirmEmail", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw ServerConfirmEmail_Error(error: error)
        }
    }
}
