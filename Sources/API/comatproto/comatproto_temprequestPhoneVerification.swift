//
// DO NOT EDIT
//
// Generated by swift-atproto
//

import SwiftAtproto
import Foundation

extension comatprototypes {
    public class TempRequestPhoneVerification_Input: Codable {
        public var phoneNumber: String

        public init(phoneNumber: String) {
            self.phoneNumber = phoneNumber
        }

        enum CodingKeys: String, CodingKey {
            case phoneNumber
        }
    }

    public enum TempRequestPhoneVerification_Error: XRPCError {
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

    public static func TempRequestPhoneVerification(client: any XRPCClientProtocol, input: TempRequestPhoneVerification_Input) async throws -> Bool {
        let params: Bool? = nil
        do {
            return try await client.fetch(endpoint: "com.atproto.temp.requestPhoneVerification", contentType: "application/json", httpMethod: .post, params: params, input: input, retry: true)
        } catch let error as UnExpectedError {
            throw TempRequestPhoneVerification_Error(error: error)
        }
    }
}
