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
    targets: [
        .target(name: "ColorCanvasUI"),
        .testTarget(name: "ColorCanvasUITests", dependencies: ["ColorCanvasUI"])
    ]
)
