// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран где создается таб бар контроллер с новигейшин контроллером
final class TabBarViewController: UITabBarController {
    enum Constants {
        static let catalog = "Каталог"
        static let basket = "Корзина"
        static let profile = "Профиль"
    }

    override func viewDidLoad() {
        view.backgroundColor = .brown
        super.viewDidLoad()
        setupController()
    }

    private func setupController() {
        let catalogViewController = CatalogViewController()
        let profileViewController = ProfileViewController()
        let basketViewController = BasketViewController()
        let catalogNavViewController = UINavigationController(rootViewController: catalogViewController)
        let profileNavViewController = UINavigationController(rootViewController: profileViewController)

        tabBar.tintColor = .colorButton

        catalogNavViewController.tabBarItem = UITabBarItem(
            title: Constants.catalog,
            image: .catalog,
            tag: 0
        )

        basketViewController.tabBarItem = UITabBarItem(
            title: Constants.basket,
            image: .profile,
            tag: 1
        )

        profileNavViewController.tabBarItem = UITabBarItem(
            title: Constants.profile,
            image: .basket,
            tag: 2
        )

        setViewControllers([catalogNavViewController, profileNavViewController, basketViewController], animated: true)
    }
}
