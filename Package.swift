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
        .package(url: "https://github.com/christopherweems/Resultto.git", .upToNextMajor(from: "0.2.2")),
        .package(url: "https://github.com/christopherweems/unstandard-algorithms.git", .branch("main")),
        .package(url: "https://github.com/christopherweems/unstandard-collections.git", .branch("main")),
        .package(url: "https://github.com/christopherweems/unstandard-strings.git", .branch("main")),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "unstandard",
            dependencies: [
                .product(name: "Resultto", package: "Resultto"),
                .product(name: "unstandardAlgorithms", package: "unstandard-algorithms"),
                .product(name: "unstandardCollections", package: "unstandard-collections"),
                .product(name: "unstandardStrings", package: "unstandard-strings"),
                "unstandardFoundation",
                "CustomDebugTreeConvertible",
            ]),
        
        .target(
            name: "unstandardFoundation"
            ),
        
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
            name: "CustomDebugTreeConvertibleTests",
            dependencies: ["CustomDebugTreeConvertible"]),
        
    ]
)
