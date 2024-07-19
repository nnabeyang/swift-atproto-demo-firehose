//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class FeedGetPosts_Output: Codable {
        public var posts: [FeedDefs_PostView]

        public init(posts: [FeedDefs_PostView]) {
            self.posts = posts
        }

        enum CodingKeys: String, CodingKey {
            case posts
        }
    }

    public enum FeedGetPosts_Error: XRPCError {
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

    public static func FeedGetPosts(client: any XRPCClientProtocol, uris: [String]) async throws -> FeedGetPosts_Output {
        let params: Parameters = ["uris": .array(uris)]
        do {
            return try await client.fetch(endpoint: "app.bsky.feed.getPosts", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw FeedGetPosts_Error(error: error)
        }
    }
}