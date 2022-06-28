// swift-tools-version:5.7

import PackageDescription

extension Array where Element == SwiftSetting {
    static let prereleaseTools: [SwiftSetting] = [
        .unsafeFlags(["-Xfrontend", "-disable-availability-checking"]),
    ]
    
    static let unstandard = prereleaseTools
    
}

let package = Package(
    name: "unstandard",
    products: [
        .library(
            name: "unstandard",
            targets: ["unstandard"]),
        
        .library(
            name: "unstandardStrings",
            targets: ["unstandardStrings"]),
        
        .library(name: "operation",
                 targets: ["operation"]),
        
        .library(name: "transfer",
                 targets: ["transfer"]),
        
    ],
    dependencies: [
        .package(url: "https://github.com/christopherweems/Resultto.git", from: "0.2.2"),
        .package(url: "https://github.com/gitmcfly/lc-locale.git", from: "0.3.0"),
        
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
            ],
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "unstandardFoundation",
            dependencies: [
                "unstandardProtocols",
            ],
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "unstandardAlgorithms",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
            ],
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "unstandardCollections",
            dependencies: [
                "BitArrayModule", "GraphModule",
                .product(name: "Collections", package: "swift-collections"),
            ],
            swiftSettings: .unstandard
        ),
    
        .target(
            name: "unstandardCollectionsFoundation",
            dependencies: [
                "unstandardCollections",
                "BitArrayModule", "GraphModule",
                .product(name: "Collections", package: "swift-collections"),
            ],
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "unstandardStrings",
            dependencies: [
                .product(name: "Algorithms", package: "swift-algorithms"),
                
            ],
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "unstandardStringsFoundation",
            dependencies: [
                "unstandardStrings",
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "lc-locale", package: "lc-locale"),
                
            ],
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "unstandardProtocols",
            swiftSettings: .unstandard
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
