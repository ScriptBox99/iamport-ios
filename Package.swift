// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "iamport-ios",
    platforms: [
            .macOS(.v10_12),
            .iOS(.v10),
        ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "iamport-ios",
            targets: ["iamport-ios"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.0.0")),
        .package(name: "RxBus", url: "https://github.com/ridi/RxBus-swift.git", .upToNextMinor(from: "1.3.0")),
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.4.0")),
        .package(url: "https://github.com/devxoul/Then.git", .upToNextMajor(from: "2.7.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
            .target(name: "iamport-ios",
                    dependencies: ["RxSwift",
                                   "RxBus",
                                   "Alamofire",
                                   "Then",
                                   .product(name: "RxCocoa",package: "RxSwift"),
                    ],
                    resources: [.process("Assets")],
                    swiftSettings: [
                        .define("IAMPORTSPM")
                    ]
            )
    ]
)
