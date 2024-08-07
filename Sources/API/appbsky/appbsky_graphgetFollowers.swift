//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class GraphGetFollowers_Output: Codable {
        public var cursor: String?
        public var followers: [ActorDefs_ProfileView]
        public var subject: ActorDefs_ProfileView

        public init(cursor: String?, followers: [ActorDefs_ProfileView], subject: ActorDefs_ProfileView) {
            self.cursor = cursor
            self.followers = followers
            self.subject = subject
        }

        enum CodingKeys: String, CodingKey {
            case cursor
            case followers
            case subject
        }
    }

    public enum GraphGetFollowers_Error: XRPCError {
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

    public static func GraphGetFollowers(client: any XRPCClientProtocol, actor: String, cursor: String?, limit: Int?) async throws -> GraphGetFollowers_Output {
        let params: Parameters = ["actor": .string(actor), "cursor": .string(cursor), "limit": .integer(limit)]
        do {
            return try await client.fetch(endpoint: "app.bsky.graph.getFollowers", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw GraphGetFollowers_Error(error: error)
        }
    }
}
