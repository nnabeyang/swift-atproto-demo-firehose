# swift-atproto-demo-firehose

swift-atproto-demo-firehose is a demo application of [Firehose](https://docs.bsky.app/docs/advanced-guides/firehose) using [swift-atproto](https://github.com/nnabeyang/swift-atproto).

### Usage

XRPC API Code generation is done as follows:
```bash
swift package plugin --allow-writing-to-package-directory swift-atproto \
  --outdir ./Sources/API \
  /path/to/bluesky-social/atproto/lexicons
```
Run code as follows:
```bash
swift run
```

## License

swift-atproto-demo-firehose is published under the MIT License, see LICENSE.

## Author
[Noriaki Watanabe@nnabeyang](https://bsky.app/profile/did:plc:bnh3bvyqr3vzxyvjdnrrusbr)
