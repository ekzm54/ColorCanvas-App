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
    dependencies: [
        .package(path: "../ColorCanvasDomain")
    ],
    targets: [
        .target(name: "ColorCanvasData", dependencies: ["ColorCanvasDomain"]),
        .testTarget(name: "ColorCanvasDataTests", dependencies: ["ColorCanvasData", "ColorCanvasDomain"])
    ]
)
