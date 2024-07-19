//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class FeedGetPostThread_Output: Codable {
        public var thread: FeedGetPostThread_Output_Thread

        public init(thread: FeedGetPostThread_Output_Thread) {
            self.thread = thread
        }

        enum CodingKeys: String, CodingKey {
            case thread
        }
    }

    public enum FeedGetPostThread_Output_Thread: Codable {
        case feedDefsThreadViewPost(FeedDefs_ThreadViewPost)
        case feedDefsNotFoundPost(FeedDefs_NotFoundPost)
        case feedDefsBlockedPost(FeedDefs_BlockedPost)
        case unknown(UnknownRecord)

        enum CodingKeys: String, CodingKey {
            case type = "$type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            switch type {
            case "app.bsky.feed.defs#threadViewPost":
                self = try .feedDefsThreadViewPost(.init(from: decoder))
            case "app.bsky.feed.defs#notFoundPost":
                self = try .feedDefsNotFoundPost(.init(from: decoder))
            case "app.bsky.feed.defs#blockedPost":
                self = try .feedDefsBlockedPost(.init(from: decoder))
            default:
                self = try .unknown(.init(from: decoder))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .feedDefsThreadViewPost(value):
                try container.encode("app.bsky.feed.defs#threadViewPost", forKey: .type)
                try value.encode(to: encoder)
            case let .feedDefsNotFoundPost(value):
                try container.encode("app.bsky.feed.defs#notFoundPost", forKey: .type)
                try value.encode(to: encoder)
            case let .feedDefsBlockedPost(value):
                try container.encode("app.bsky.feed.defs#blockedPost", forKey: .type)
                try value.encode(to: encoder)
            case .unknown:
                break
            }
        }
    }

    public enum FeedGetPostThread_Error: XRPCError {
        case notfound(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "NotFound":
                self = .notfound(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .notfound:
                return "NotFound"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .notfound(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func FeedGetPostThread(client: any XRPCClientProtocol, depth: Int?, parentHeight: Int?, uri: String) async throws -> FeedGetPostThread_Output {
        let params: Parameters = ["depth": .integer(depth), "parentHeight": .integer(parentHeight), "uri": .string(uri)]
        do {
            return try await client.fetch(endpoint: "app.bsky.feed.getPostThread", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw FeedGetPostThread_Error(error: error)
        }
    }
}
