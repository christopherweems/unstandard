// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "unstandard",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "unstandard",
            targets: ["unstandard"]),
        
        .library(name: "operation",
                 targets: ["operation"]),
        
        .library(name: "transfer",
                 targets: ["transfer"]),
        
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-algorithms.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/apple/swift-collections.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/christopherweems/Resultto.git", .upToNextMajor(from: "0.1.2")),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "unstandard",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Resultto", package: "Resultto"),
                "CustomDebugTreeConvertible", "unstandardStrings"
            ]),
        
        .target(
            name: "unstandardStrings",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "Collections", package: "swift-collections"),
                .product(name: "Resultto", package: "Resultto"),
            ]),
        
        .target(
            name: "CustomDebugTreeConvertible",
            path: "Sources/Standard Library Additions/CustomDebugTreeConvertible/"
        ),
        
        .target(
            name: "operation",
            dependencies: []
        ),
        
        .target(
            name: "transfer",
            dependencies: ["unstandard"]),
        
        .testTarget(
            name: "unstandardTests",
            dependencies: ["unstandard"]),
        
        .testTarget(
            name: "unstandardStringsTests",
            dependencies: [
                "unstandardStrings",
                "unstandard"
            ]),
        
        .testTarget(
            name: "CustomDebugTreeConvertibleTests",
            dependencies: ["CustomDebugTreeConvertible"]),
        
    ]
)
