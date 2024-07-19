//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public enum LabelerService_Labels: Codable {
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

public class appbskytypes_LabelerService: Codable {
    public let type = "app.bsky.labeler.service"
    public var createdAt: String
    public var labels: appbskytypes.LabelerService_Labels?
    public var policies: appbskytypes.LabelerDefs_LabelerPolicies

    public init(createdAt: String, labels: appbskytypes.LabelerService_Labels?, policies: appbskytypes.LabelerDefs_LabelerPolicies) {
        self.createdAt = createdAt
        self.labels = labels
        self.policies = policies
    }

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case createdAt
        case labels
        case policies
    }
}
