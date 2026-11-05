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
            url: "https://artifacts.applovin.com/ios/com/applovin/axon-sdk/AxonSDK-1.3.4.xcframework.zip",
            checksum: "4d1a1b99c4efbbcf55acf81882a2972a2e0212ba7627eee3e0e4a7f2ee64c72e"
        )
    ]
)
