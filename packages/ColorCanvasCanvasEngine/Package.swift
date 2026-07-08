// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasCanvasEngine",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasCanvasEngine", targets: ["ColorCanvasCanvasEngine"])
    ],
    targets: [
        .target(name: "ColorCanvasCanvasEngine"),
        .testTarget(name: "ColorCanvasCanvasEngineTests", dependencies: ["ColorCanvasCanvasEngine"])
    ]
)
