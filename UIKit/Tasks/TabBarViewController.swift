// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран где создается таб бар контроллер
final class TabBarViewController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        static let tape = "Лента"
        static let notifications = "Уведомления"
        static let profile = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

    private func setupController() {
        let tapeViewController = TapeViewController()
        let notificationsViewController = NotificationsViewController()
        let profileViewController = ProfileViewController()
        let tapeNavViewController = UINavigationController(rootViewController: tapeViewController)
        let notificationsNavViewController = UINavigationController(rootViewController: notificationsViewController)

        tapeViewController.tabBarItem = UITabBarItem(title: Constants.tape, image: .home, tag: 0)
        notificationsViewController.tabBarItem = UITabBarItem(
            title: Constants.notifications,
            image: .notification,
            tag: 1
        )
        profileViewController.tabBarItem = UITabBarItem(title: Constants.profile, image: .profile, tag: 2)

        setViewControllers(
            [tapeNavViewController, notificationsNavViewController, profileViewController],
            animated: true
        )
    }
}
