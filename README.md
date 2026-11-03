# Axon SDK for Swift Package Manager

This repository distributes the AppLovin Axon SDK for iOS through Swift Package
Manager. The SDK itself is a binary `.xcframework` hosted on
`artifacts.applovin.com`; this repository only carries the package manifest.

## Integration

In Xcode, choose **File > Add Package Dependencies…**, enter this repository's
URL, pick a dependency rule, and add the `AxonSDK` library to your app target.

Or declare it in your own `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/AppLovin/AppLovin-Lite-Swift-Package.git", .upToNextMajor(from: "1.3.2"))
]
```

Then import it:

```swift
import AxonSDK

let config = ALAxonInitializationConfiguration(key: "<YOUR_SDK_KEY>")
Axon.shared.initialize(with: config) { }
```

No additional linker flags are required.

## Requirements

- iOS 12.0 or later
- Xcode 15 or later

## Other integration methods

CocoaPods is also supported:

```ruby
pod 'AxonSDK'
```

See the [integration guide](https://support.axon.ai/en/growth/promoting-your-websites/axon-pixel-integration/mobile-app-integration/ios/integration)
for full documentation.

## Releases

Versions are published automatically by the Axon iOS SDK release pipeline. Each
release updates `Package.swift` with the new artifact URL and checksum, and
tags the commit with the bare version number.

## License

The AppLovin Axon SDK is available under a
[commercial license](https://www.applovin.com/eula).
