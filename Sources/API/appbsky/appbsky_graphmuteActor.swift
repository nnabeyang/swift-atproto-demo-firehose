//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class GraphMuteActor_Input: Codable {
        public var actor: String

        public init(actor: String) {
            self.actor = actor
        }

        enum CodingKeys: String, CodingKey {
            case actor
        }
    }

    public enum GraphMuteActor_Error: XRPCError {
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

    public static func GraphMuteActor(client: any XRPCClientProtocol, input: GraphMuteActor_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "app.bsky.graph.muteActor", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw GraphMuteActor_Error(error: error)
        }
    }
}
