// swift-tools-version:5.3

import PackageDescription

let firebaseVersion = "7.4.0"

let package = Package(
    name: "FirebaseUI",
    defaultLocalization: "en",
    platforms: [.iOS(.v12), .macOS(.v10_15)],
    products: [
        .library(
            name: "Auth",
            targets: ["Auth"]
        ),
        .library(
            name: "OAuth",
            targets: ["OAuth"]
        ),
        .library(
            name: "Google",
            targets: ["Google"]
        ),
//        .library(
//            name: "Facebook",
//            targets: ["Facebook"]
//        ),
        .library(
            name: "Email",
            targets: ["Email"]
        ),
    ],
    dependencies: [
        .package(name: "Firebase",
                 url: "https://github.com/firebase/firebase-ios-sdk.git",
                 from: "7.4.0"),
//        .package(name: "Facebook",
//                 url: "https://github.com/facebook/facebook-ios-sdk.git",
//                 from: "9.0.0"),
    ],
    targets: [
        .target(
            name: "Auth",
            dependencies: [
                .product(name: "FirebaseAuth", package: "Firebase"),
            ],
            path: "Auth/FirebaseAuthUI",
            exclude: ["Info.plist"],
            resources: [.process("Resources"), .process("Strings")],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("./"),
                .headerSearchPath("./AccountManagement/"),
            ]
        ),
        .target(
            name: "OAuth",
            dependencies: [
                .product(name: "FirebaseAuth", package: "Firebase"),
            ],
            path: "OAuth/FirebaseOAuthUI",
            exclude: ["Info.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("./"),
            ]
        ),
        .target(
            name: "Google",
            dependencies: [
                "Auth"
            ],
            path: "GoogleAuth/FirebaseGoogleAuthUI",
            exclude: ["Info.plist"],
            resources: [.process("Resources"), .process("Strings")],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("./"),
            ]
        ),
//        .target(
//            name: "Facebook",
//            dependencies: [
//                "Auth",
//                .product(name: "FBSDKLoginKit", package: "facebook-ios-sdk"),
//                .product(name: "FBSDKCoreKit", package: "facebook-ios-sdk"),
//            ],
//            path: "FacebookAuth/FirebaseFacebookAuthUI",
//            exclude: ["Info.plist"],
//            resources: [.process("Resources"), .process("Strings")],
//            publicHeadersPath: ".",
//            cSettings: [
//                .headerSearchPath("./"),
//            ]
//        ),
        .target(
            name: "Email",
            dependencies: ["Auth"],
            path: "EmailAuth/FirebaseEmailAuthUI",
            exclude: ["Info.plist"],
            resources: [.process("Resources")],
            publicHeadersPath: ".",
            cSettings: [
                .headerSearchPath("./"),
                //        .headerSearchPath("../../Auth/FirebaseAuthUI")
            ]),
    ]
)
