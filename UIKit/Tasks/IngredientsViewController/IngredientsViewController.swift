// IngredientsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol IngredientsDelegate: AnyObject {
    func updatePriceAndView(price: Model)
}

/// Класс для выбора дополнительных ингридиентов
final class IngredientsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let numbers = [50, 28, 50, 70, 50]
        static let confirmation = "choose"
        static var cost = 100
    }

    private let ingredientsView = IngredientsView()

    // MARK: - Public Properties

    weak var delegate: IngredientsDelegate?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupColorText()
    }

    // MARK: - Private Methods

    private func changeTextColor(nameLabel: UILabel, price: String) {
        let price = NSAttributedString(
            string: price,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
        )
        let text = NSMutableAttributedString(string: nameLabel.text ?? "")
        text.append(price)
        nameLabel.attributedText = text
    }

    func setupColorText() {
        changeTextColor(nameLabel: ingredientsView.milkLabel, price: ingredientsView.price[0])
        changeTextColor(nameLabel: ingredientsView.syrupLabel, price: ingredientsView.price[1])
        changeTextColor(nameLabel: ingredientsView.soyMilkLabel, price: ingredientsView.price[2])
        changeTextColor(nameLabel: ingredientsView.almondMilkLabel, price: ingredientsView.price[3])
        changeTextColor(nameLabel: ingredientsView.espressoLabel, price: ingredientsView.price[4])
    }

    private func setupView() {
        view = ingredientsView
        view.backgroundColor = .white
        ingredientsView.closeScreenButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        ingredientsView.milkSwitch.addTarget(self, action: #selector(takeIngredients), for: .touchUpInside)
        ingredientsView.syrupSwitch.addTarget(self, action: #selector(takeIngredients), for: .touchUpInside)
        ingredientsView.soyMilkSwitch.addTarget(self, action: #selector(takeIngredients), for: .touchUpInside)
        ingredientsView.almondMilkSwitch.addTarget(self, action: #selector(takeIngredients), for: .touchUpInside)
        ingredientsView.espressoSwitch.addTarget(self, action: #selector(takeIngredients), for: .touchUpInside)
    }

    @objc private func takeIngredients(sender: UISwitch) {
        switch sender {
        case ingredientsView.milkSwitch:
            Constants.cost += Constants.numbers[0]
        case ingredientsView.syrupSwitch:
            Constants.cost += Constants.numbers[1]
        case ingredientsView.soyMilkSwitch:
            Constants.cost += Constants.numbers[2]
        case ingredientsView.almondMilkSwitch:
            Constants.cost += Constants.numbers[3]
        case ingredientsView.espressoSwitch:
            Constants.cost += Constants.numbers[4]
        default: break
        }
    }

    @objc private func closeScreen() {
        let number = Model(sum: Constants.cost, confirmation: Constants.confirmation)
        delegate?.updatePriceAndView(price: number)
        dismiss(animated: true)
    }
}
