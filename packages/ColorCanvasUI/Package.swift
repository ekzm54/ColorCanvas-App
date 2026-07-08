// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasUI",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasUI", targets: ["ColorCanvasUI"])
    ],
    dependencies: [
        .package(path: "../ColorCanvasApplication"),
        .package(path: "../ColorCanvasDesignSystem")
    ],
    targets: [
        .target(name: "ColorCanvasUI", dependencies: ["ColorCanvasApplication", "ColorCanvasDesignSystem"]),
        .testTarget(name: "ColorCanvasUITests", dependencies: ["ColorCanvasUI"])
    ]
)
