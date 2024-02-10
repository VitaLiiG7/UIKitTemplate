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
        guard let window = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: window)
        let registrationViewController = RegistrationViewController()
        let navViewController = UINavigationController()
        navViewController.viewControllers = [registrationViewController]
        self.window?.rootViewController = navViewController
        self.window?.makeKeyAndVisible()

        func sceneDidDisconnect(_ scene: UIScene) {}

        func sceneDidBecomeActive(_ scene: UIScene) {}

        func sceneWillResignActive(_ scene: UIScene) {}

        func sceneWillEnterForeground(_ scene: UIScene) {}

        func sceneDidEnterBackground(_ scene: UIScene) {}
    }
}
