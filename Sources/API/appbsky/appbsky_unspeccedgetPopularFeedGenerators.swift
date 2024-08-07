//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class UnspeccedGetPopularFeedGenerators_Output: Codable {
        public var cursor: String?
        public var feeds: [FeedDefs_GeneratorView]

        public init(cursor: String?, feeds: [FeedDefs_GeneratorView]) {
            self.cursor = cursor
            self.feeds = feeds
        }

        enum CodingKeys: String, CodingKey {
            case cursor
            case feeds
        }
    }

    public enum UnspeccedGetPopularFeedGenerators_Error: XRPCError {
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

    public static func UnspeccedGetPopularFeedGenerators(client: any XRPCClientProtocol, cursor: String?, limit: Int?, query: String?) async throws -> UnspeccedGetPopularFeedGenerators_Output {
        let params: Parameters = ["cursor": .string(cursor), "limit": .integer(limit), "query": .string(query)]
        do {
            return try await client.fetch(endpoint: "app.bsky.unspecced.getPopularFeedGenerators", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw UnspeccedGetPopularFeedGenerators_Error(error: error)
        }
    }
}
