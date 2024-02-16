// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран корзина, сюда прихоидт выбранный товар ( делает коллега )
final class BasketViewController: UIViewController {
    // MARK: - Private Properties

    private var arrayMap: [InformationAboutShoes: Int] = [:]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - Public Methods

    func addCard(info: InformationAboutShoes, size: Int) {
        arrayMap.updateValue(size, forKey: info)
    }
}
