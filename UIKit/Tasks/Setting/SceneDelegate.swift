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
        window = UIWindow(windowScene: windowScene)
        let menuViewController = AuthorizationViewController()
//        let navigationController = UINavigationController()
//        navigationController.viewControllers = [menuViewController]
        window?.rootViewController = UINavigationController(rootViewController: menuViewController)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white

        setupWindow()
    }

    func setupWindow() {}
}
