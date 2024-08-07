//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class NotificationRegisterPush_Input: Codable {
        public var appId: String
        public var platform: String
        public var serviceDid: String
        public var token: String

        public init(appId: String, platform: String, serviceDid: String, token: String) {
            self.appId = appId
            self.platform = platform
            self.serviceDid = serviceDid
            self.token = token
        }

        enum CodingKeys: String, CodingKey {
            case appId
            case platform
            case serviceDid
            case token
        }
    }

    public enum NotificationRegisterPush_Input_Platform: RawRepresentable, Codable {
        public typealias RawValue = String

        case ios
        case android
        case web
        case unknown(String)

        public init?(rawValue: String) {
            switch rawValue {
            case "ios":
                self = .ios
            case "android":
                self = .android
            case "web":
                self = .web
            default:
                self = .unknown(rawValue)
            }
        }

        public var rawValue: String {
            switch self {
            case .ios:
                "ios"
            case .android:
                "android"
            case .web:
                "web"
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

    public enum NotificationRegisterPush_Error: XRPCError {
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

    public static func NotificationRegisterPush(client: any XRPCClientProtocol, input: NotificationRegisterPush_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "app.bsky.notification.registerPush", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw NotificationRegisterPush_Error(error: error)
        }
    }
}
