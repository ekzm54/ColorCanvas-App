// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasResources",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasResources", targets: ["ColorCanvasResources"])
    ],
    targets: [
        .target(name: "ColorCanvasResources"),
        .testTarget(name: "ColorCanvasResourcesTests", dependencies: ["ColorCanvasResources"])
    ]
)
