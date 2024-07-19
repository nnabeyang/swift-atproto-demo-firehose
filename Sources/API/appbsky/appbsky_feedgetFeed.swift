//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class FeedGetFeed_Output: Codable {
        public var cursor: String?
        public var feed: [FeedDefs_FeedViewPost]

        public init(cursor: String?, feed: [FeedDefs_FeedViewPost]) {
            self.cursor = cursor
            self.feed = feed
        }

        enum CodingKeys: String, CodingKey {
            case cursor
            case feed
        }
    }

    public enum FeedGetFeed_Error: XRPCError {
        case unknownfeed(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "UnknownFeed":
                self = .unknownfeed(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .unknownfeed:
                return "UnknownFeed"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .unknownfeed(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func FeedGetFeed(client: any XRPCClientProtocol, cursor: String?, feed: String, limit: Int?) async throws -> FeedGetFeed_Output {
        let params: Parameters = ["cursor": .string(cursor), "feed": .string(feed), "limit": .integer(limit)]
        do {
            return try await client.fetch(endpoint: "app.bsky.feed.getFeed", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw FeedGetFeed_Error(error: error)
        }
    }
}
