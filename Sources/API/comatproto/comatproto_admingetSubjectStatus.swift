//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class AdminGetSubjectStatus_Output: Codable {
        public var deactivated: AdminDefs_StatusAttr?
        public var subject: AdminGetSubjectStatus_Output_Subject
        public var takedown: AdminDefs_StatusAttr?

        public init(deactivated: AdminDefs_StatusAttr?, subject: AdminGetSubjectStatus_Output_Subject, takedown: AdminDefs_StatusAttr?) {
            self.deactivated = deactivated
            self.subject = subject
            self.takedown = takedown
        }

        enum CodingKeys: String, CodingKey {
            case deactivated
            case subject
            case takedown
        }
    }

    public enum AdminGetSubjectStatus_Output_Subject: Codable {
        case adminDefsRepoRef(AdminDefs_RepoRef)
        case repoStrongRef(RepoStrongRef)
        case adminDefsRepoBlobRef(AdminDefs_RepoBlobRef)
        case unknown(UnknownRecord)

        enum CodingKeys: String, CodingKey {
            case type = "$type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            switch type {
            case "com.atproto.admin.defs#repoRef":
                self = try .adminDefsRepoRef(.init(from: decoder))
            case "com.atproto.repo.strongRef":
                self = try .repoStrongRef(.init(from: decoder))
            case "com.atproto.admin.defs#repoBlobRef":
                self = try .adminDefsRepoBlobRef(.init(from: decoder))
            default:
                self = try .unknown(.init(from: decoder))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .adminDefsRepoRef(value):
                try container.encode("com.atproto.admin.defs#repoRef", forKey: .type)
                try value.encode(to: encoder)
            case let .repoStrongRef(value):
                try container.encode("com.atproto.repo.strongRef", forKey: .type)
                try value.encode(to: encoder)
            case let .adminDefsRepoBlobRef(value):
                try container.encode("com.atproto.admin.defs#repoBlobRef", forKey: .type)
                try value.encode(to: encoder)
            case .unknown:
                break
            }
        }
    }

    public enum AdminGetSubjectStatus_Error: XRPCError {
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

    public static func AdminGetSubjectStatus(client: any XRPCClientProtocol, blob: String?, did: String?, uri: String?) async throws -> AdminGetSubjectStatus_Output {
        let params: Parameters = ["blob": .string(blob), "did": .string(did), "uri": .string(uri)]
        do {
            return try await client.fetch(endpoint: "com.atproto.admin.getSubjectStatus", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw AdminGetSubjectStatus_Error(error: error)
        }
    }
}
