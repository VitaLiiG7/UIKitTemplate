// SceneDelegate.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        createRootViewController(windowScene)
    }

    func createRootViewController(_ windowScene: UIWindowScene) {
        let mainViewController = TabBarViewController()
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = mainViewController
        window?.makeKeyAndVisible()
    }
}
