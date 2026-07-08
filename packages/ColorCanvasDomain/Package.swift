// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ColorCanvasDomain",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(name: "ColorCanvasDomain", targets: ["ColorCanvasDomain"])
    ],
    targets: [
        .target(name: "ColorCanvasDomain"),
        .testTarget(name: "ColorCanvasDomainTests", dependencies: ["ColorCanvasDomain"])
    ]
)
