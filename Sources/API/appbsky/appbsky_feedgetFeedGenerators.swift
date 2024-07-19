//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class FeedGetFeedGenerators_Output: Codable {
        public var feeds: [FeedDefs_GeneratorView]

        public init(feeds: [FeedDefs_GeneratorView]) {
            self.feeds = feeds
        }

        enum CodingKeys: String, CodingKey {
            case feeds
        }
    }

    public enum FeedGetFeedGenerators_Error: XRPCError {
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

    public static func FeedGetFeedGenerators(client: any XRPCClientProtocol, feeds: [String]) async throws -> FeedGetFeedGenerators_Output {
        let params: Parameters = ["feeds": .array(feeds)]
        do {
            return try await client.fetch(endpoint: "app.bsky.feed.getFeedGenerators", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw FeedGetFeedGenerators_Error(error: error)
        }
    }
}
