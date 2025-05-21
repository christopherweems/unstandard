// swift-tools-version:5.11
import PackageDescription

extension Array where Element == SwiftSetting {
    static let prereleaseTools: [SwiftSetting] = []
    
    static let unstandard = prereleaseTools
    
}

let package = Package(
    name: "unstandard",
    platforms: [
        .macOS(.v13),
        .iOS(.v16),
        .tvOS(.v16),
        .watchOS(.v9),
        
    ],
    products: [
        .library(
            name: "unstandard",
            targets: ["unstandard", "_UAParserSwift"]),
        
        .library(
            name: "unstandardStrings",
            targets: ["unstandardStrings"]),
        
        .library(name: "operation",
                 targets: ["operation"]),
        
        .library(name: "Resultto",
                 targets: ["Resultto"]),
        
        .library(name: "transfer",
                 targets: ["transfer"]),
        
        .library(
            name: "DirectoryPath",
            targets: [
                "DirectoryPath",
                "DirectoryPathExtras"
            ]
        ),
        
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms.git", from: "1.2.0"),
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.1.0"),
        .package(url: "https://github.com/apple/swift-system.git", from: "1.4.0"),
        
    ],
    targets: [
        .target(
            name: "unstandard",
            dependencies: [
                "unstandardProtocols",
                "unstandardFoundation",
                
                "unstandardAlgorithms",
                
                "unstandardCollections",
                "unstandardCollectionsFoundation",
                
                "unstandardStrings",
                "unstandardStringsFoundation",
                
                "CustomDebugTreeConvertible",
                "Resultto",
                
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
                
            ],
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "unstandardProtocols",
            swiftSettings: .unstandard
        ),
        
        .target(
            name: "DirectoryPath",
            dependencies: [
                .product(name: "SystemPackage", package: "swift-system"),
                
            ],
            path: "Sources/DirectoryPath/DirectoryPath"
        ),
        
        .target(
            name: "DirectoryPathExtras",
            dependencies: [
                "DirectoryPath",
                .product(name: "SystemPackage", package: "swift-system"),
                
            ],
            path: "Sources/DirectoryPath/DirectoryPathExtras"
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
            name: "Resultto",
            dependencies: []
        ),
        
        .target(
            name: "operation",
            dependencies: []
        ),
        
        /* guest targets */
        
        .target(
            name: "_UAParserSwift",
            path: "Sources/UAParserSwift"
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
