// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealSentryAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealSentryAdapter",
            targets: ["AppodealSentryAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/getsentry/sentry-cocoa", exact: "8.58.4"),
    ],
    targets: [
        .target(
            name: "AppodealSentryAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "Sentry", package: "sentry-cocoa"),
                .target(name: "AppodealSentryAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealSentryAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealSentryAdapter/8.58.4.0/cb39ce6b8b06/AppodealSentryAdapter.xcframework.zip",
            checksum: "cb39ce6b8b067452973400d01a8bb583ab9c7dfe1ffec51b0687b31a3a3b81d5"
        ),

    ]
)
