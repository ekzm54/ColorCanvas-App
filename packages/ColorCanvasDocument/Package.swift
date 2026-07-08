// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasDocument",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasDocument", targets: ["ColorCanvasDocument"])
    ],
    targets: [
        .target(name: "ColorCanvasDocument"),
        .testTarget(name: "ColorCanvasDocumentTests", dependencies: ["ColorCanvasDocument"])
    ]
)
