// swift-tools-version:5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "unstandard",
    products: [
        .library(
            name: "unstandard",
            targets: ["unstandard"]),
        
        .library(name: "operation",
                 targets: ["operation"]),
        
        .library(name: "transfer",
                 targets: ["transfer"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/christopherweems/Resultto.git", .upToNextMajor(from: "0.2.2")),
        .package(url: "https://github.com/gitMcFly/lc-locale.git", from: "0.1.0"),
        
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.0.0"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.2"),
        
    ],
    targets: [
        .target(
            name: "unstandard",
            dependencies: [
                .product(name: "Resultto", package: "Resultto"),
                "unstandardProtocols",
                "unstandardFoundation",
                
                "unstandardAlgorithms",
                
                "unstandardCollections",
                "unstandardCollectionsFoundation",
                
                "unstandardStrings",
                "unstandardStringsFoundation",
                
                "CustomDebugTreeConvertible",
            ]),
        
        .target(
            name: "unstandardFoundation",
            dependencies: [
                "unstandardProtocols",
            ]
        ),
        
        .target(
            name: "unstandardAlgorithms",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
            ]
        ),
        
        .target(
            name: "unstandardCollections",
            dependencies: [
                "BitArrayModule", "GraphModule",
                .product(name: "Collections", package: "swift-collections"),
            ]
        ),
    
        .target(
            name: "unstandardCollectionsFoundation",
            dependencies: [
                .product(name: "Collections", package: "swift-collections"),
            ]
        ),
        
        .target(
            name: "unstandardStrings",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                
            ]),
        
        .target(
            name: "unstandardStringsFoundation",
            dependencies: [
                "unstandardStrings",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "lc-locale", package: "lc-locale"),
                
            ]
        ),
        
        .target(
            name: "unstandardProtocols"
        ),
        
        /* sub modules */
        
        .target(
            name: "CustomDebugTreeConvertible",
            path: "Sources/Standard Library Additions/CustomDebugTreeConvertible/"
        ),
        
        .target(
            name: "BitArrayModule",
            path: "Sources/Swift Collections Additions/BitArrayModule/"),
        
        .target(
            name: "GraphModule",
            dependencies: [
                .product(name: "Resultto", package: "Resultto"),
            ],
            path: "Sources/Swift Collections Additions/GraphModule/"
        ),
        
        .target(
            name: "operation",
            dependencies: []
        ),

        /* tests */
        
        .target(
            name: "transfer",
            dependencies: ["unstandard"]),
        
        .testTarget(
            name: "unstandardTests",
            dependencies: [
                "unstandard",
                "unstandardAlgorithms",
                "unstandardCollections",
                "unstandardStrings",
            ]),
        
        .testTarget(
            name: "CustomDebugTreeConvertibleTests",
            dependencies: ["CustomDebugTreeConvertible"]),
        
    ]
)
