//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class TempFetchLabels_Output: Codable {
        public var labels: [LabelDefs_Label]

        public init(labels: [LabelDefs_Label]) {
            self.labels = labels
        }

        enum CodingKeys: String, CodingKey {
            case labels
        }
    }

    public enum TempFetchLabels_Error: XRPCError {
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

    public static func TempFetchLabels(client: any XRPCClientProtocol, limit: Int?, since: Int?) async throws -> TempFetchLabels_Output {
        let params: Parameters = ["limit": .integer(limit), "since": .integer(since)]
        do {
            return try await client.fetch(endpoint: "com.atproto.temp.fetchLabels", contentType: "*/*", httpMethod: .get, params: params, input: Bool?.none, retry: true)
        } catch let error as UnExpectedError {
            throw TempFetchLabels_Error(error: error)
        }
    }
}
