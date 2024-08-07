//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class ModerationCreateReport_Input: Codable {
        public var reason: String?
        public var reasonType: ModerationDefs_ReasonType
        public var subject: ModerationCreateReport_Input_Subject

        public init(reason: String?, reasonType: ModerationDefs_ReasonType, subject: ModerationCreateReport_Input_Subject) {
            self.reason = reason
            self.reasonType = reasonType
            self.subject = subject
        }

        enum CodingKeys: String, CodingKey {
            case reason
            case reasonType
            case subject
        }
    }

    public enum ModerationCreateReport_Input_Subject: Codable {
        case adminDefsRepoRef(AdminDefs_RepoRef)
        case repoStrongRef(RepoStrongRef)
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
            case .unknown:
                break
            }
        }
    }

    public class ModerationCreateReport_Output: Codable {
        public var createdAt: String
        public var id: Int
        public var reason: String?
        public var reasonType: ModerationDefs_ReasonType
        public var reportedBy: String
        public var subject: ModerationCreateReport_Output_Subject

        public init(createdAt: String, id: Int, reason: String?, reasonType: ModerationDefs_ReasonType, reportedBy: String, subject: ModerationCreateReport_Output_Subject) {
            self.createdAt = createdAt
            self.id = id
            self.reason = reason
            self.reasonType = reasonType
            self.reportedBy = reportedBy
            self.subject = subject
        }

        enum CodingKeys: String, CodingKey {
            case createdAt
            case id
            case reason
            case reasonType
            case reportedBy
            case subject
        }
    }

    public enum ModerationCreateReport_Output_Subject: Codable {
        case adminDefsRepoRef(AdminDefs_RepoRef)
        case repoStrongRef(RepoStrongRef)
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
            case .unknown:
                break
            }
        }
    }

    public enum ModerationCreateReport_Error: XRPCError {
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

    public static func ModerationCreateReport(client: any XRPCClientProtocol, input: ModerationCreateReport_Input) async throws -> ModerationCreateReport_Output {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.moderation.createReport", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw ModerationCreateReport_Error(error: error)
        }
    }
}
