import Foundation
import SwiftAtproto

public class XRPCClient: XRPCBaseClient {
    public static let shared = {
        let client = XRPCClient(host: URL(string: "https://example.com")!)
        return client
    }()
}
