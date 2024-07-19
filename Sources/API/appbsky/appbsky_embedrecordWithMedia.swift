//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class EmbedRecordWithMedia: Codable {
        public var media: EmbedRecordWithMedia_Media
        public var record: EmbedRecord

        public init(media: EmbedRecordWithMedia_Media, record: EmbedRecord) {
            self.media = media
            self.record = record
        }

        enum CodingKeys: String, CodingKey {
            case media
            case record
        }
    }

    public enum EmbedRecordWithMedia_Media: Codable {
        case embedImages(EmbedImages)
        case embedExternal(EmbedExternal)
        case unknown(UnknownRecord)

        enum CodingKeys: String, CodingKey {
            case type = "$type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            switch type {
            case "app.bsky.embed.images":
                self = try .embedImages(.init(from: decoder))
            case "app.bsky.embed.external":
                self = try .embedExternal(.init(from: decoder))
            default:
                self = try .unknown(.init(from: decoder))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .embedImages(value):
                try container.encode("app.bsky.embed.images", forKey: .type)
                try value.encode(to: encoder)
            case let .embedExternal(value):
                try container.encode("app.bsky.embed.external", forKey: .type)
                try value.encode(to: encoder)
            case .unknown:
                break
            }
        }
    }

    public class EmbedRecordWithMedia_View: Codable {
        public var media: EmbedRecordWithMedia_View_Media
        public var record: EmbedRecord_View

        public init(media: EmbedRecordWithMedia_View_Media, record: EmbedRecord_View) {
            self.media = media
            self.record = record
        }

        enum CodingKeys: String, CodingKey {
            case media
            case record
        }
    }

    public enum EmbedRecordWithMedia_View_Media: Codable {
        case embedImagesView(EmbedImages_View)
        case embedExternalView(EmbedExternal_View)
        case unknown(UnknownRecord)

        enum CodingKeys: String, CodingKey {
            case type = "$type"
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            let type = try container.decode(String.self, forKey: .type)
            switch type {
            case "app.bsky.embed.images#view":
                self = try .embedImagesView(.init(from: decoder))
            case "app.bsky.embed.external#view":
                self = try .embedExternalView(.init(from: decoder))
            default:
                self = try .unknown(.init(from: decoder))
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            switch self {
            case let .embedImagesView(value):
                try container.encode("app.bsky.embed.images#view", forKey: .type)
                try value.encode(to: encoder)
            case let .embedExternalView(value):
                try container.encode("app.bsky.embed.external#view", forKey: .type)
                try value.encode(to: encoder)
            case .unknown:
                break
            }
        }
    }
}