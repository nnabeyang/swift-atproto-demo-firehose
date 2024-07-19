//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public enum GraphList_Labels: Codable {
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

public class appbskytypes_GraphList: Codable {
    public let type = "app.bsky.graph.list"
    public var avatar: LexBlob?
    public var createdAt: String
    public var description: String?
    public var descriptionFacets: [appbskytypes.RichtextFacet]?
    public var labels: appbskytypes.GraphList_Labels?
    public var name: String
    public var purpose: appbskytypes.GraphDefs_ListPurpose

    public init(avatar: LexBlob?, createdAt: String, description: String?, descriptionFacets: [appbskytypes.RichtextFacet]?, labels: appbskytypes.GraphList_Labels?, name: String, purpose: appbskytypes.GraphDefs_ListPurpose) {
        self.avatar = avatar
        self.createdAt = createdAt
        self.description = description
        self.descriptionFacets = descriptionFacets
        self.labels = labels
        self.name = name
        self.purpose = purpose
    }

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case avatar
        case createdAt
        case description
        case descriptionFacets
        case labels
        case name
        case purpose
    }
}
