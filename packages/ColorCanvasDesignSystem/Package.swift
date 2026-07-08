// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasDesignSystem",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasDesignSystem", targets: ["ColorCanvasDesignSystem"])
    ],
    targets: [
        .target(name: "ColorCanvasDesignSystem"),
        .testTarget(name: "ColorCanvasDesignSystemTests", dependencies: ["ColorCanvasDesignSystem"])
    ]
)
