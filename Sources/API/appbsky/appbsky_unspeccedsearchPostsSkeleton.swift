//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class UnspeccedSearchPostsSkeleton_Output: Codable {
        public var cursor: String?
        public var hitsTotal: Int?
        public var posts: [UnspeccedDefs_SkeletonSearchPost]

        public init(cursor: String?, hitsTotal: Int?, posts: [UnspeccedDefs_SkeletonSearchPost]) {
            self.cursor = cursor
            self.hitsTotal = hitsTotal
            self.posts = posts
        }

        enum CodingKeys: String, CodingKey {
            case cursor
            case hitsTotal
            case posts
        }
    }

    public enum UnspeccedSearchPostsSkeleton_Sort: RawRepresentable, Codable {
        public typealias RawValue = String

        case top
        case latest
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "top":
                self = .top
            case "latest":
                self = .latest
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .top:
                "top"
            case .latest:
                "latest"
            case let .unknown(value):
                value
            }
        }

        public init(from decoder: any Decoder) throws {
            let rawValue = try String(from: decoder)
            self = Self (rawValue: rawValue)!
        }

        public func encode(to encoder: any Encoder) throws {
            try rawValue.encode(to: encoder)
        }
    }

    public enum UnspeccedSearchPostsSkeleton_Error: XRPCError {
        case badquerystring(String?)
        case unexpected(error: String?, message: String?)

        public init(error: UnExpectedError) {
            switch error.error {
            case "BadQueryString":
                self = .badquerystring(error.message)
            default:
                self = .unexpected(error: error.error, message: error.message)
            }
        }

        public var error: String? {
            switch self {
            case .badquerystring:
                return "BadQueryString"
            case let .unexpected(error, _):
                return error
            }
        }

        public var message: String? {
            switch self {
            case let .badquerystring(message):
                return message
            case let .unexpected(_, message):
                return message
            }
        }
    }

    public static func UnspeccedSearchPostsSkeleton(client: any XRPCClientProtocol, author: String?, cursor: String?, domain: String?, lang: String?, limit: Int?, mentions: String?, q: String, since: String?, sort: UnspeccedSearchPostsSkeleton_Sort?, tag: [String]?, until: String?, url: String?, viewer: String?) async throws -> UnspeccedSearchPostsSkeleton_Output {
        let params: Parameters = ["author": .string(author), "cursor": .string(cursor), "domain": .string(domain), "lang": .string(lang), "limit": .integer(limit), "mentions": .string(mentions), "q": .string(q), "since": .string(since), "sort": .string(sort?.rawValue), "tag": .array(tag), "until": .string(until), "url": .string(url), "viewer": .string(viewer)]
        do {
            return try await client.fetch(endpoint: "app.bsky.unspecced.searchPostsSkeleton", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw UnspeccedSearchPostsSkeleton_Error(error: error)
        }
    }
}
