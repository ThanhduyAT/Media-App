// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DIContainer",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DIContainer",
            targets: ["DIContainer"]),
    ],
    dependencies: [
        .package(url: "https://github.com/hmlongco/Factory.git", from: "2.3.1"),
        .package(path: "../Common"),
        .package(path: "../Domain"),
        .package(path: "../DataRepositories")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DIContainer",
            dependencies: [
                "Common",
                .product(name: "Factory", package: "Factory"),
                .product(name: "AudioDomain", package: "Domain"),
                .product(name: "DataRepositories", package: "DataRepositories")
            ]
        ),
        .testTarget(
            name: "DIContainerTests",
            dependencies: ["DIContainer"]
        ),
    ]
)
