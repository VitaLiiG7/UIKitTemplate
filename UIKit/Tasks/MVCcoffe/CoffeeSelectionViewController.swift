// CoffeeSelectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Класс для выбора  и заказа кофе
class CoffeeSelectionViewController: UIViewController {
    // MARK: - Constants

    private let viewCoffee = ViewCoffee()
    private let coffee = [UIImage(named: "coffee"), UIImage(named: "cappuccino"), UIImage(named: "latte")]
    private let tapGesture = UITapGestureRecognizer()
    private let tapGestureTwo = UITapGestureRecognizer()

    // MARK: - Life Cycle

    override func loadView() {
        view = viewCoffee
        viewCoffee.segmentControll.addTarget(self, action: #selector(changeImage), for: .valueChanged)

        tapGesture.addTarget(self, action: #selector(changeCoffee))
        tapGestureTwo.addTarget(self, action: #selector(changeIngredients))
        viewCoffee.darkRoastingImageView.addGestureRecognizer(tapGesture)
        viewCoffee.chooseIngredientsImageView.addGestureRecognizer(tapGestureTwo)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    @objc func changeIngredients() {
        let modalViewController = IngredientsViewController()
        present(modalViewController, animated: true)
    }

    @objc func changeCoffee() {
        let modalViewController = ChoiceRoastingViewController()
        present(modalViewController, animated: true)
    }

    @objc private func changeImage(target: UISegmentedControl) {
        if target == viewCoffee.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            viewCoffee.coffeeImageView.image = coffee[segmentIndex]
        }
    }
}
