// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LogDogCryptoSwift",
    platforms: [
      .macOS(.v10_12), .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(name: "LogDogCryptoSwift", targets: ["LogDogCryptoSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/luoxiu/LogDog.git", .branch("master")),
        .package(url: "https://github.com/krzyzanowskim/CryptoSwift.git", .upToNextMajor(from: "1.3.4")),
    ],
    targets: [
        .target(name: "LogDogCryptoSwift", dependencies: ["LogDog", "CryptoSwift"]),
        .testTarget(name: "LogDogCryptoSwiftTests", dependencies: ["LogDogCryptoSwift"]),
    ]
)
