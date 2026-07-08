// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasSafeColor",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasSafeColor", targets: ["ColorCanvasSafeColor"])
    ],
    targets: [
        .target(name: "ColorCanvasSafeColor"),
        .testTarget(name: "ColorCanvasSafeColorTests", dependencies: ["ColorCanvasSafeColor"])
    ]
)
