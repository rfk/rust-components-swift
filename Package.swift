// swift-tools-version:5.4
import PackageDescription

let package = Package(
    name: "MozillaRustComponentsSwift",
    platforms: [.iOS(.v11)],
    products: [
        .library(name: "RustLog", targets: ["RustLog"]),
        .library(name: "Viaduct", targets: ["Viaduct"]),
        .library(name: "Nimbus", targets: ["Nimbus"]),
        .library(name: "CrashTest", targets: ["CrashTest"]),
        .library(name: "Logins", targets: ["Logins"]),
        .library(name: "FxAClient", targets: ["FxAClient"]),
    ],
    dependencies: [
        // TODO: ship Glean via this same bundle?
        .package(name: "Glean", url: "https://github.com/mozilla/glean-swift", from: "39.0.4"),
        .package(name: "SwiftKeychainWrapper", url: "https://github.com/jrendel/SwiftKeychainWrapper", from: "4.0.1")
    ],
    targets: [
        .target(
            // TODO: we should make a proper package for this.
            name: "Sync15",
            path: "external/application-services/megazords/ios",
            sources: ["SyncUnlockInfo.swift"]
        ),
        .target(
            name: "RustLog",
            dependencies: ["MozillaRustComponents"],
            path: "external/application-services/megazords/ios/RustLog"
        ),
        .target(
            name: "Viaduct",
            dependencies: ["MozillaRustComponents"],
            path: "external/application-services/megazords/ios/Viaduct"
        ),
        .target(
            name: "Nimbus",
            dependencies: ["MozillaRustComponents", "Glean"],
            path: "external/application-services/components/nimbus/ios"
        ),
        .target(
            name: "CrashTest",
            dependencies: ["MozillaRustComponents"],
            path: "external/application-services/components/crashtest/ios"
        ),
        .target(
            name: "Logins",
            dependencies: ["MozillaRustComponents", "Sync15"],
            path: "external/application-services/components/logins/ios"
        ),
        .target(
            name: "FxAClient",
            dependencies: ["MozillaRustComponents", "SwiftKeychainWrapper"],
            path: "external/application-services/components/fxa-client/ios"
        ),
        .binaryTarget(
            name: "MozillaRustComponents",
            // For local testing, you can point at an (unzipped) XCFramework that's part of the repo.
            //path: "./MozillaRustComponents.xcframework"
            // For release artifacts, reference the MozillaRustComponents as a URL with checksum.
            url: "https://github.com/rfk/rust-components-swift/releases/download/0.2.0/MozillaRustComponents.xcframework.zip",
            checksum: "8efc6ebb4123763a2721e116440fdf40a6f44a1887d187c0c0507d41aad04570"
        )
    ]
)
