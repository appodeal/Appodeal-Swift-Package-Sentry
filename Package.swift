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
        .package(url: "https://github.com/getsentry/sentry-cocoa", exact: "8.57.2"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealSentryAdapter/8.57.2.2/865b343d22f3/AppodealSentryAdapter.xcframework.zip",
            checksum: "865b343d22f3cca1fae0b7d46d693bcdf69702f545557f3b291e29ac1c7bc317"
        ),

    ]
)
