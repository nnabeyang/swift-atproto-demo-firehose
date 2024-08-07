//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comwhtwndtypes {
    public class BlogDefs_BlobMetadata: Codable {
        public var blobref: LexBlob
        public var name: String?

        public init(blobref: LexBlob, name: String?) {
            self.blobref = blobref
            self.name = name
        }

        enum CodingKeys: String, CodingKey {
            case blobref
            case name
        }
    }

    public class BlogDefs_BlogEntry: Codable {
        public var content: String
        public var createdAt: String?

        public init(content: String, createdAt: String?) {
            self.content = content
            self.createdAt = createdAt
        }

        enum CodingKeys: String, CodingKey {
            case content
            case createdAt
        }
    }

    public class BlogDefs_Comment: Codable {
        public var content: String
        public var entryUri: String

        public init(content: String, entryUri: String) {
            self.content = content
            self.entryUri = entryUri
        }

        enum CodingKeys: String, CodingKey {
            case content
            case entryUri
        }
    }

    public class BlogDefs_Ogp: Codable {
        public var height: Int?
        public var url: String
        public var width: Int?

        public init(height: Int?, url: String, width: Int?) {
            self.height = height
            self.url = url
            self.width = width
        }

        enum CodingKeys: String, CodingKey {
            case height
            case url
            case width
        }
    }
}
