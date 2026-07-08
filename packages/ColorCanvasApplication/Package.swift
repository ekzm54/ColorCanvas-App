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
    dependencies: [
        .package(path: "../ColorCanvasDomain"),
        .package(path: "../ColorCanvasShared")
    ],
    targets: [
        .target(name: "ColorCanvasApplication", dependencies: ["ColorCanvasDomain", "ColorCanvasShared"]),
        .testTarget(
            name: "ColorCanvasApplicationTests",
            dependencies: ["ColorCanvasApplication", "ColorCanvasDomain", "ColorCanvasShared"]
        )
    ]
)
