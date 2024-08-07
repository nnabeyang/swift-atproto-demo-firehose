//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ServerGetAccountInviteCodes_Output: Codable {
        public var codes: [ServerDefs_InviteCode]

        public init(codes: [ServerDefs_InviteCode]) {
            self.codes = codes
        }

        enum CodingKeys: String, CodingKey {
            case codes
        }
    }

    public enum ServerGetAccountInviteCodes_Error: XRPCError {
        case duplicatecreate(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "DuplicateCreate":
                self = .duplicatecreate(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .duplicatecreate:
                return "DuplicateCreate"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .duplicatecreate(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func ServerGetAccountInviteCodes(client: any XRPCClientProtocol, createAvailable: Bool?, includeUsed: Bool?) async throws -> ServerGetAccountInviteCodes_Output {
        let params: Parameters = ["createAvailable": .bool(createAvailable), "includeUsed": .bool(includeUsed)]
        do {
            return try await client.fetch(endpoint: "com.atproto.server.getAccountInviteCodes", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw ServerGetAccountInviteCodes_Error(error: error)
        }
    }
}
