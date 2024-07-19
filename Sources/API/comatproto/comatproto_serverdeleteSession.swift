//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public enum ServerDeleteSession_Error: XRPCError {
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

    public static func ServerDeleteSession(client: any XRPCClientProtocol) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.server.deleteSession", contentType: "*/*", httpMethod: .post, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw ServerDeleteSession_Error(error: error)
        }
    }
}
