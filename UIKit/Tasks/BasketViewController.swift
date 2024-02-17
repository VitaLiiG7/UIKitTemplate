// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран корзина, сюда прихоидт выбранный товар ( делает коллега )
final class BasketViewController: UIViewController {
    // MARK: - Private Properties

    private var dictMap: [InformationAboutShoes: Int] = [:]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - Public Methods

    func addCard(info: InformationAboutShoes, size: Int) {
        dictMap.updateValue(size, forKey: info)
    }
}
