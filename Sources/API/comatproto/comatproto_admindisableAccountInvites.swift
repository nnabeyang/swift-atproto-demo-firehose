//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class AdminDisableAccountInvites_Input: Codable {
        public var account: String
        public var note: String?

        public init(account: String, note: String?) {
            self.account = account
            self.note = note
        }

        enum CodingKeys: String, CodingKey {
            case account
            case note
        }
    }

    public enum AdminDisableAccountInvites_Error: XRPCError {
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

    public static func AdminDisableAccountInvites(client: any XRPCClientProtocol, input: AdminDisableAccountInvites_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.admin.disableAccountInvites", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw AdminDisableAccountInvites_Error(error: error)
        }
    }
}
