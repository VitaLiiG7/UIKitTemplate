// TabBarViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран где создается таб бар контроллер с новигейшин контроллером
final class TabBarViewController: UITabBarController {
    // MARK: - Constants

    enum Constants {
        static let catalog = "Каталог"
        static let basket = "Корзина"
        static let profile = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupController()
    }

    // MARK: - Private Methods

    private func setupController() {
        let catalogViewController = CatalogViewController()
        let basketViewController = BasketViewController()
        let profileViewController = ProfileViewController()
        let catalogNavViewController = UINavigationController(rootViewController: catalogViewController)
        let basketNavigationViewController = UINavigationController(rootViewController: basketViewController)
        let profileNavViewController = UINavigationController(rootViewController: profileViewController)

        tabBar.tintColor = .colorButton
        setViewControllers(
            [catalogNavViewController, basketNavigationViewController, profileNavViewController],
            animated: true
        )
    }
}
