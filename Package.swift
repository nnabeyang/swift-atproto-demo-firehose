// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-atproto-demo-firehose",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/nnabeyang/swift-atproto", exact: "0.13.1"),
        .package(url: "https://github.com/hummingbird-project/hummingbird-websocket", revision: "3d694eb6b8ad646955b210c3db5afed1927b7c6d"),
        .package(url: "https://github.com/nnabeyang/swift-cbor", exact: "0.0.4"),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", exact: "0.53.8")
    ],
    targets: [
        .executableTarget(
            name: "swift-firehose",
            dependencies: [
                "Firehose"
            ],
            path: "CommandLine"
        ),
        .target(
            name: "Firehose",
            dependencies: [
                "API",
                .product(name: "SwiftCbor", package: "swift-cbor"),
                .product(name: "HummingbirdWSClient", package: "hummingbird-websocket")
            ]
        ),
        .target(name: "API",
               dependencies: [
                .product(name: "SwiftAtproto", package: "swift-atproto"),
               ]
        )
    ]
)
