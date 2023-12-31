// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "SweetDeclarations",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "SweetDeclarationsLib",
            targets: ["SweetDeclarationsLib"]
        ),
        .executable(
            name: "SweetDeclarationsClient",
            targets: ["SweetDeclarationsClient"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-syntax.git",
            from: "509.0.0-swift-5.9-DEVELOPMENT-SNAPSHOT-2023-04-25-b"
        ),
    ],
    targets: [
        .macro(
            name: "SweetDeclarationsPlugin",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(name: "SweetDeclarationsLib", dependencies: ["SweetDeclarationsPlugin"]),
        .executableTarget(name: "SweetDeclarationsClient", dependencies: ["SweetDeclarationsLib"]),
        .testTarget(
            name: "SweetDeclarationsLibTests",
            dependencies: [
                "SweetDeclarationsLib",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        )
    ]
)
