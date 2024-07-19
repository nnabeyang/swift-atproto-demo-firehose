//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class UnspeccedGetTaggedSuggestions_Output: Codable {
        public var suggestions: [UnspeccedGetTaggedSuggestions_Suggestion]

        public init(suggestions: [UnspeccedGetTaggedSuggestions_Suggestion]) {
            self.suggestions = suggestions
        }

        enum CodingKeys: String, CodingKey {
            case suggestions
        }
    }

    public class UnspeccedGetTaggedSuggestions_Suggestion: Codable {
        public var subject: String
        public var subjectType: String
        public var tag: String

        public init(subject: String, subjectType: String, tag: String) {
            self.subject = subject
            self.subjectType = subjectType
            self.tag = tag
        }

        enum CodingKeys: String, CodingKey {
            case subject
            case subjectType
            case tag
        }
    }

    public enum UnspeccedGetTaggedSuggestions_Suggestion_SubjectType: RawRepresentable, Codable {
        public typealias RawValue = String

        case actor
        case feed
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "actor":
                self = .actor
            case "feed":
                self = .feed
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .actor:
                "actor"
            case .feed:
                "feed"
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

    public enum UnspeccedGetTaggedSuggestions_Error: XRPCError {
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

    public static func UnspeccedGetTaggedSuggestions(client: any XRPCClientProtocol) async throws -> UnspeccedGetTaggedSuggestions_Output {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "app.bsky.unspecced.getTaggedSuggestions", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw UnspeccedGetTaggedSuggestions_Error(error: error)
        }
    }
}
