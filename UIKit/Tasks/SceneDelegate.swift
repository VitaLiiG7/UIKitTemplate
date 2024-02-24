// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
//        createRootViewController(windowScene)
    }

//    private func createRootViewController(_ windoScene: UIWindowScene) {
//        let mainViewController = ViewController()
//        window = UIWindow(windowScene: windoScene)
//        window?.rootViewController = mainViewController
//        window?.makeKeyAndVisible()
//    }
}
