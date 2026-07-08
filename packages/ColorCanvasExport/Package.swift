// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasExport",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasExport", targets: ["ColorCanvasExport"])
    ],
    targets: [
        .target(name: "ColorCanvasExport"),
        .testTarget(name: "ColorCanvasExportTests", dependencies: ["ColorCanvasExport"])
    ]
)
