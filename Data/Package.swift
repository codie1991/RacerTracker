// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Data",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "NetworkCore",
            targets: ["NetworkCore"]
        ),
        .library(
            name: "NetworkExtension",
            targets: ["NetworkExtension"]
        ),
        .library(
            name: "Repositories",
            targets: ["Repositories"]
        ),
        .library(
            name: "DataTestHelpers",
            targets: ["DataTestHelpers"]
        )
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(url: "https://github.com/Thieurom/Pilot", from: "0.5.1"),
        .package(url: "https://github.com/Quick/Quick", from: "6.1.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "11.2.1")
    ],
    targets: [
        .target(
            name: "NetworkCore",
            dependencies: []
        ),
        .target(
            name: "NetworkExtension",
            dependencies: [
                "NetworkCore",
                .product(name: "Pilot", package: "Pilot"),
                .product(name: "PilotType", package: "Pilot")
            ]
        ),
        .target(
            name: "Repositories",
            dependencies: [
                "NetworkCore",
                .product(name: "Entities", package: "Domain"),
                .product(name: "RepositoryProtocol", package: "Domain")
            ]
        ),
        .target(
            name: "DataTestHelpers",
            dependencies: [
                "NetworkCore",
                "NetworkExtension",
                .product(name: "Entities", package: "Domain")
            ]
        ),
        .testTarget(
            name: "RepositoriesTests",
            dependencies: [
                "NetworkCore",
                "Repositories",
                "DataTestHelpers",
                .product(name: "Quick", package: "Quick"),
                .product(name: "Nimble", package: "Nimble")
            ]
        )
    ]
)
