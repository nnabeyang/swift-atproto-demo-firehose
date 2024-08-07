//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ServerDeactivateAccount_Input: Codable {
        public var deleteAfter: String?

        public init(deleteAfter: String?) {
            self.deleteAfter = deleteAfter
        }

        enum CodingKeys: String, CodingKey {
            case deleteAfter
        }
    }

    public enum ServerDeactivateAccount_Error: XRPCError {
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

    public static func ServerDeactivateAccount(client: any XRPCClientProtocol, input: ServerDeactivateAccount_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.server.deactivateAccount", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw ServerDeactivateAccount_Error(error: error)
        }
    }
}
