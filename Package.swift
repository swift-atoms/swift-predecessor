// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-predecessor",
    platforms: [
        .macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27),
    ],
    products: [
        .library(name: "Predecessor", targets: ["Predecessor"]),

        .library(name: "Predecessor Foundation Integration", targets: ["Predecessor Foundation Integration"]),
        .library(name: "Predecessor Test Support", targets: ["Predecessor Test Support"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-atoms/swift-subtraction.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Predecessor",
            dependencies: [
                .product(name: "Subtraction", package: "swift-subtraction"),
            ],
            path: "Sources/Predecessor"
        ),
        
        .target(
            name: "Predecessor Foundation Integration",
            dependencies: [
                .target(name: "Predecessor"),
            ],
            path: "Sources/Predecessor Foundation Integration"
        ),
        .target(
            name: "Predecessor Test Support",
            dependencies: [
                .target(name: "Predecessor"),
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Predecessor Tests",
            dependencies: [
                .target(name: "Predecessor"),
                .product(name: "Subtraction", package: "swift-subtraction"),
                .target(name: "Predecessor Test Support"),
                .target(name: "Predecessor Foundation Integration"),
            ],
            path: "Tests/Predecessor Tests"
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets {
    target.swiftSettings = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]
}
