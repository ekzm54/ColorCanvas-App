// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasData",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasData", targets: ["ColorCanvasData"])
    ],
    targets: [
        .target(name: "ColorCanvasData"),
        .testTarget(name: "ColorCanvasDataTests", dependencies: ["ColorCanvasData"])
    ]
)
