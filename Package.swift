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
    ],
    dependencies: [
        .package(name: "Glean", url: "https://github.com/mozilla/glean-swift", from: "39.0.0")
    ],
    targets: [
        .target(
            name: "RustLog",
            dependencies: ["MozillaRustComponents"],
            path: "components/rustlog"
        ),
        .target(
            name: "Viaduct",
            dependencies: ["MozillaRustComponents"],
            path: "components/viaduct"
        ),
        .target(
            name: "Nimbus",
            dependencies: ["MozillaRustComponents", "Glean"],
            path: "components/nimbus"
        ),
        .target(
            name: "CrashTest",
            dependencies: ["MozillaRustComponents"],
            path: "components/crashtest"
        ),
        .binaryTarget(
            name: "MozillaRustComponents",
            url: "https://user.fm/files/v2-707bfbe4deabae4d16bf9c200256cd95/MozillaRustComponents.xcframework.zip",
            checksum: "8a3451f5cc65225e0bbebb8058d51c27a5d7000d57c9e587a9887e9b63cfa75e"
        )
    ]
)
