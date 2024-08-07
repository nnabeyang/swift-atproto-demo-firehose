//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public enum SyncGetRepo_Error: XRPCError {
        case repodeactivated(String?)
        case reponotfound(String?)
        case reposuspended(String?)
        case repotakendown(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "RepoNotFound":
                self = .reponotfound(error.message)
            case "RepoTakendown":
                self = .repotakendown(error.message)
            case "RepoSuspended":
                self = .reposuspended(error.message)
            case "RepoDeactivated":
                self = .repodeactivated(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .reponotfound:
                return "RepoNotFound"
            case .repotakendown:
                return "RepoTakendown"
            case .reposuspended:
                return "RepoSuspended"
            case .repodeactivated:
                return "RepoDeactivated"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .reponotfound(message):
                return message
            case let .repotakendown(message):
                return message
            case let .reposuspended(message):
                return message
            case let .repodeactivated(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func SyncGetRepo(client: any XRPCClientProtocol, did: String, since: String?) async throws -> Data {
        let params: Parameters = ["did": .string(did), "since": .string(since)]
        do {
            return try await client.fetch(endpoint: "com.atproto.sync.getRepo", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw SyncGetRepo_Error(error: error)
        }
    }
}
