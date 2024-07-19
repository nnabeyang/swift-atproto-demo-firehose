//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public enum FeedGenerator_Labels: Codable {
        case comAtprotoLabelDefsSelfLabels(comatprototypes.LabelDefs_SelfLabels)
        case unknown(UnknownRecord)

        enum CodingKeys: String, CodingKey {
            case type = "$type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            switch type {
            case "com.atproto.label.defs#selfLabels":
                self = try .comAtprotoLabelDefsSelfLabels(.init(from: decoder))
            default:
                self = try .unknown(.init(from: decoder))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .comAtprotoLabelDefsSelfLabels(value):
                try container.encode("com.atproto.label.defs#selfLabels", forKey: .type)
                try value.encode(to: encoder)
            case .unknown:
                break
            }
        }
    }
}

public class appbskytypes_FeedGenerator: Codable {
    public let type = "app.bsky.feed.generator"
    public var acceptsInteractions: Bool?
    public var avatar: LexBlob?
    public var createdAt: String
    public var description: String?
    public var descriptionFacets: [appbskytypes.RichtextFacet]?
    public var did: String
    public var displayName: String
    public var labels: appbskytypes.FeedGenerator_Labels?

    public init(acceptsInteractions: Bool?, avatar: LexBlob?, createdAt: String, description: String?, descriptionFacets: [appbskytypes.RichtextFacet]?, did: String, displayName: String, labels: appbskytypes.FeedGenerator_Labels?) {
        self.acceptsInteractions = acceptsInteractions
        self.avatar = avatar
        self.createdAt = createdAt
        self.description = description
        self.descriptionFacets = descriptionFacets
        self.did = did
        self.displayName = displayName
        self.labels = labels
    }

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case acceptsInteractions
        case avatar
        case createdAt
        case description
        case descriptionFacets
        case did
        case displayName
        case labels
    }
}