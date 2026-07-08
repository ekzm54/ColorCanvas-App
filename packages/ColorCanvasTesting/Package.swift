// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasTesting",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasTesting", targets: ["ColorCanvasTesting"])
    ],
    targets: [
        .target(name: "ColorCanvasTesting"),
        .testTarget(name: "ColorCanvasTestingTests", dependencies: ["ColorCanvasTesting"])
    ]
)
