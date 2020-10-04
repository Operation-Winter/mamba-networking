// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mamba-networking",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "MambaNetworking",
            targets: ["MambaNetworking"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "MambaNetworking",
            dependencies: [],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "MambaNetworkingTests",
            dependencies: ["MambaNetworking"]),
    ]
)
