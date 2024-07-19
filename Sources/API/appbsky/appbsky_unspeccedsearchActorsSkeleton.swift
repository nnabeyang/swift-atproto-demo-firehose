//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class UnspeccedSearchActorsSkeleton_Output: Codable {
        public var actors: [UnspeccedDefs_SkeletonSearchActor]
        public var cursor: String?
        public var hitsTotal: Int?

        public init(actors: [UnspeccedDefs_SkeletonSearchActor], cursor: String?, hitsTotal: Int?) {
            self.actors = actors
            self.cursor = cursor
            self.hitsTotal = hitsTotal
        }

        enum CodingKeys: String, CodingKey {
            case actors
            case cursor
            case hitsTotal
        }
    }

    public enum UnspeccedSearchActorsSkeleton_Error: XRPCError {
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

    public static func UnspeccedSearchActorsSkeleton(client: any XRPCClientProtocol, cursor: String?, limit: Int?, q: String, typeahead: Bool?, viewer: String?) async throws -> UnspeccedSearchActorsSkeleton_Output {
        let params: Parameters = ["cursor": .string(cursor), "limit": .integer(limit), "q": .string(q), "typeahead": .bool(typeahead), "viewer": .string(viewer)]
        do {
            return try await client.fetch(endpoint: "app.bsky.unspecced.searchActorsSkeleton", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw UnspeccedSearchActorsSkeleton_Error(error: error)
        }
    }
}