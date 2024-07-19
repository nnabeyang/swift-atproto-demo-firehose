//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension appbskytypes {
    public class GraphGetBlocks_Output: Codable {
        public var blocks: [ActorDefs_ProfileView]
        public var cursor: String?

        public init(blocks: [ActorDefs_ProfileView], cursor: String?) {
            self.blocks = blocks
            self.cursor = cursor
        }

        enum CodingKeys: String, CodingKey {
            case blocks
            case cursor
        }
    }

    public enum GraphGetBlocks_Error: XRPCError {
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

    public static func GraphGetBlocks(client: any XRPCClientProtocol, cursor: String?, limit: Int?) async throws -> GraphGetBlocks_Output {
        let params: Parameters = ["cursor": .string(cursor), "limit": .integer(limit)]
        do {
            return try await client.fetch(endpoint: "app.bsky.graph.getBlocks", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw GraphGetBlocks_Error(error: error)
        }
    }
}