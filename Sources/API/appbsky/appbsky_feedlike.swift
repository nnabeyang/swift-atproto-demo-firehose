//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

public class appbskytypes_FeedLike: Codable {
    public let type = "app.bsky.feed.like"
    public var createdAt: String
    public var subject: comatprototypes.RepoStrongRef

    public init(createdAt: String, subject: comatprototypes.RepoStrongRef) {
        self.createdAt = createdAt
        self.subject = subject
    }

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case createdAt
        case subject
    }
}