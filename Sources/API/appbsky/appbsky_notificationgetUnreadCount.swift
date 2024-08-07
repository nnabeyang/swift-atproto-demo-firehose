//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class NotificationGetUnreadCount_Output: Codable {
        public var count: Int

        public init(count: Int) {
            self.count = count
        }

        enum CodingKeys: String, CodingKey {
            case count
        }
    }

    public enum NotificationGetUnreadCount_Error: XRPCError {
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

    public static func NotificationGetUnreadCount(client: any XRPCClientProtocol, seenAt: String?) async throws -> NotificationGetUnreadCount_Output {
        let params: Parameters = ["seenAt": .string(seenAt)]
        do {
            return try await client.fetch(endpoint: "app.bsky.notification.getUnreadCount", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw NotificationGetUnreadCount_Error(error: error)
        }
    }
}
