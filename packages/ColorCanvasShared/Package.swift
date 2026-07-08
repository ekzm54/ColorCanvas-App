// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasShared",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasShared", targets: ["ColorCanvasShared"])
    ],
    targets: [
        .target(name: "ColorCanvasShared"),
        .testTarget(name: "ColorCanvasSharedTests", dependencies: ["ColorCanvasShared"])
    ]
)
