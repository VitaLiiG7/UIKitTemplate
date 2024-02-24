// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// MARK: - Protocols

/// Экран корзина, сюда прихоидт выбранный товар ( делает коллега )
final class BasketViewController: UIViewController {
    // MARK: - Constants
    
    private enum Constants {
        static let basket = "Корзина"
        static let boldFont = "Verdana-Bold"
        static let mediumSize = 16
    }
    // MARK: - Visual Components

    let checkoutButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.backgroundColor = #colorLiteral(red: 0.8334643245, green: 0.0985333994, blue: 0.4855454564, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.boldFont, size: CGFloat(Constants.mediumSize))
        button.layer.cornerRadius = 12
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowOpacity = 0.5
        button.layer.shadowRadius = 10
        return button
    }()



    // MARK: - Public Properties
    let basketViewEx = BasketView()
    var shouses: [Shoes] = [] {
        didSet {
            addShoes()
        }
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods
    
    private func setupUI() {
        navigationItem.title = "Корзина"
        view.backgroundColor = .white
        view.addSubview(checkoutButton)
        setupCheckoutButton()
    }

    private func setupCheckoutButton() {
        checkoutButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        checkoutButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        checkoutButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        checkoutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }

    private func createBusketView(shoes: Shoes, coordinataY: Int) {
        let basketViewEx = BasketView()
        basketViewEx.shoesImage.image = UIImage(named: shoes.image)
        basketViewEx.totalLabel.text = shoes.price
        view.addSubview(basketViewEx)
        basketViewEx.translatesAutoresizingMaskIntoConstraints = false
        basketViewEx.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        basketViewEx.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        basketViewEx.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(coordinataY)).isActive = true
    }

    private func updatePrice() {
        defaultPrice = 0
        for shoes in shouses {
            if let price = Int(shoes.price) {
                defaultPrice += price
            }
        }
        print(defaultPrice)
        checkoutButton.setTitle("Оформить заказ - \(defaultPrice)", for: .normal)
        checkoutButton.isHidden = false
    }

    private func addShoes() {
        var coordinataY = 0
        for shoes in shouses {
            createBusketView(shoes: shoes, coordinataY: coordinataY)
            coordinataY += 190
        }
        updatePrice()
    }

    var defaultPrice = 0
}

extension BasketViewController: ChoosingShoesViewControllerDelegate {
    func transitionInformation(item: Shoes) {
        shouses.append(item)
    }
}
