// CoffeeSelectionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

///  Класс для выбора  и заказа кофе
final class CoffeeSelectionViewController: UIViewController, UIGestureRecognizerDelegate {
    // MARK: - Constants
    
    enum Constants {
        static let darkRoasting = "Темная \nобжарка"
        static let price = "Цѣна -"
        static let rub = "руб"
        static let promocode = "У тебя есть промокод"
    }
    
    private let coffeeView = ViewCoffee()
    private let coffeePictures = [UIImage(named: "coffee"), UIImage(named: "cappuccino"), UIImage(named: "latte")]
    private let tapGestureRoast = UITapGestureRecognizer()
    private let tapGestureIngredients = UITapGestureRecognizer()
    
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
        coffeeView.orderButton.addTarget(self, action: #selector(issueReceipt), for: .touchUpInside)
        tapGestureRoast.addTarget(self, action: #selector(changeRoast))
        tapGestureIngredients.addTarget(self, action: #selector(changeIngredients))
        coffeeView.darkRoastingImageView.addGestureRecognizer(tapGestureRoast)
        coffeeView.chooseIngredientsImageView.addGestureRecognizer(tapGestureIngredients)
        coffeeView.orderButton.addTarget(self, action: #selector(placeOrder), for: .touchUpInside)
        navigationItem.leftBarButtonItem = setNavigationItemLeft()
        navigationItem.rightBarButtonItem = setNavigationItemRight()
    }
    
    @objc func issueReceipt() {
        print("dsdsd")
        let modalViewController = ChequeViewController()
        modalViewController.label.text = coffeeView.priceLabel.text ?? ""
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
    
    @objc func placeOrder() {
        let modalViewController = ChequeViewController()
        present(modalViewController, animated: true)
        modalViewController.label.text = coffeeView.priceLabel.text
    }
}

// расширение где изменяем картинку с зернами кофе и название
extension CoffeeSelectionViewController: CoffeeRoastDelegate {
    func changeRoasting(roasting: Model) {
        for (key, value) in roasting.coffeeMap {
            coffeeView.roastingLabel.text = key
            coffeeView.darkRoastingImageView.image = UIImage(named: value)
        }
    }
}

// расширение где изменяем цену и подтверждаем при помощи делегата
extension CoffeeSelectionViewController: IngredientsDelegate {
    func updatePriceAndView(price: Model) {
        coffeeView.priceLabel.text = "\(Constants.price) \(String(price.sum)) \(Constants.rub)"
        coffeeView.chooseIngredientsImageView.image = UIImage(named: price.confirmation)
    }
}
