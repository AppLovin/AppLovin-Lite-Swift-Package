// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AxonSDK",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "AxonSDK",
            targets: ["AxonSDKResources"]
        )
    ],
    targets: [
        // Wrapper target: .binaryTarget cannot carry linkerSettings, so the
        // system framework links live here. Mirrors AxonSDK.podspec.
        .target(
            name: "AxonSDKResources",
            dependencies: [
                .target(name: "AxonSDK")
            ],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CFNetwork"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("MessageUI"),
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                .linkedLibrary("z")
                // AppTrackingTransparency is weak-linked by AxonSDK.framework
                // itself, so it is deliberately not listed here.
                //
                // AxonSDK.framework is a dynamic framework, so -ObjC is not
                // required to load its Objective-C categories. Unlike the MAX
                // Swift package, consumers do not need to add it manually.
            ]
        ),
        .binaryTarget(
            name: "AxonSDK",
            url: "https://artifacts.applovin.com/ios/com/applovin/axon-sdk/AxonSDK-1.3.2.xcframework.zip",
            checksum: "95e42cd62da440ee01668b22d6959cbbbcbdd015d4b7e098b1f3d070a86cf1bf"
        )
    ]
)
