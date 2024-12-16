// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "priorityqueue-swift",
    products: [
        .library(
            name: "PriorityQueue",
            targets: ["PriorityQueue"]),
    ],
    targets: [
        .target(
            name: "PriorityQueue"),
        .testTarget(
            name: "PriorityQueueTests",
            dependencies: ["PriorityQueue"]),
    ],
    swiftLanguageVersions: [.v5]
)
