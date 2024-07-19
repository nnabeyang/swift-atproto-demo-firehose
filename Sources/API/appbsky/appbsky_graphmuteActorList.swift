//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class GraphMuteActorList_Input: Codable {
        public var list: String

        public init(list: String) {
            self.list = list
        }

        enum CodingKeys: String, CodingKey {
            case list
        }
    }

    public enum GraphMuteActorList_Error: XRPCError {
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

    public static func GraphMuteActorList(client: any XRPCClientProtocol, input: GraphMuteActorList_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "app.bsky.graph.muteActorList", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw GraphMuteActorList_Error(error: error)
        }
    }
}