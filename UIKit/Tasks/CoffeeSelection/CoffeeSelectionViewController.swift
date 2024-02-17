// CoffeeSelectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Экран для выбора  и заказа кофе
final class CoffeeSelectionViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Constants

    enum Constants {
        static let darkRoasting = "Темная \nобжарка"
        static let price = "Цѣна -"
        static let rub = "руб"
        static let promocode = "У тебя есть промокод"
    }

    // MARK: - Private Properties

    private let coffeeView = ViewCoffee()
    private let cheque = ChequeViewController()
    private let coffeePictures = [UIImage(named: "coffee"), UIImage(named: "cappuccino"), UIImage(named: "latte")]
    private lazy var tapGestureRoast = UITapGestureRecognizer(target: self, action: #selector(changeRoast))

    private lazy var tapGestureIngredients = UITapGestureRecognizer(target: self, action: #selector(changeIngredients))

    private var delegate: CoffeeRoastDelegate?

    // MARK: - Life Cycle

    override func loadView() {
        view = coffeeView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        coffeeView.segmentControll.addTarget(self, action: #selector(changeCoffeeImageView), for: .valueChanged)
        coffeeView.orderButton.addTarget(self, action: #selector(presentIssueReceipt), for: .touchUpInside)
        coffeeView.darkRoastingImageView.addGestureRecognizer(tapGestureRoast)
        coffeeView.chooseIngredientsImageView.addGestureRecognizer(tapGestureIngredients)
        coffeeView.orderButton.addTarget(self, action: #selector(presentPlaceOrder), for: .touchUpInside)
        navigationItem.leftBarButtonItem = setNavigationItemLeft()
        navigationItem.rightBarButtonItem = setNavigationItemRight()
    }

    @objc func presentPlaceOrder() {
        let modalViewController = ChequeViewController()
        present(modalViewController, animated: true)
        modalViewController.totalLabel.text = coffeeView.priceLabel.text
    }

    @objc func presentIssueReceipt() {
        let modalViewController = ChequeViewController()
        modalViewController.totalLabel.text = coffeeView.priceLabel.text ?? ""
        present(modalViewController, animated: true)
    }

    @objc func changeIngredients() {
        let modalViewController = IngredientsViewController()
        modalViewController.delegate = self
        present(modalViewController, animated: true)
    }

    @objc func changeRoast() {
        let modalViewController = ChoiceRoastingViewController()
        if coffeeView.roastingLabel.text == Constants.darkRoasting {
            modalViewController.chooseDarkRoast()
        } else {
            modalViewController.chooseLightRoast()
        }

        modalViewController.delegate = self
        present(modalViewController, animated: true)
    }

    @objc private func changeCoffeeImageView(target: UISegmentedControl) {
        if target == coffeeView.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            coffeeView.coffeeImageView.image = coffeePictures[segmentIndex]
        }
    }
}

// Изменяем картинку с зернами кофе и название
extension CoffeeSelectionViewController: CoffeeRoastDelegate {
    func changeRoasting(roasting: CoffeeAndIngredients) {
        for (key, value) in roasting.coffeeMap {
            coffeeView.roastingLabel.text = key
            coffeeView.darkRoastingImageView.image = UIImage(named: value)
        }
    }
}

// расширение где изменяем цену и подтверждаем при помощи делегата
extension CoffeeSelectionViewController: IngredientsDelegate {
    func updatePrice(price: CoffeeAndIngredients) {
        coffeeView.priceLabel.text = "\(Constants.price) \(String(price.sum)) \(Constants.rub)"
        coffeeView.chooseIngredientsImageView.image = UIImage(named: price.confirmation)
    }
}
