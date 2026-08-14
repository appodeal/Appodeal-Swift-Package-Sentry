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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealSentryAdapter/8.57.2.1/AppodealSentryAdapter.xcframework.zip",
            checksum: "ecb4c2cf019d1e3477836386c93c02d042c18576bb0bec7387b75a4dce0f3e8a"
        ),

    ]
)
