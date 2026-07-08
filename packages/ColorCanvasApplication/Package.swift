// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasApplication",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasApplication", targets: ["ColorCanvasApplication"])
    ],
    targets: [
        .target(name: "ColorCanvasApplication"),
        .testTarget(name: "ColorCanvasApplicationTests", dependencies: ["ColorCanvasApplication"])
    ]
)
