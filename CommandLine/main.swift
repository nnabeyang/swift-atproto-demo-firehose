import Firehose

try await Firehose.main(url: "wss://bsky.network/xrpc/com.atproto.sync.subscribeRepos")
