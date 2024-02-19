// ChoosingShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для выбора размера обуви
final class ChoosingShoesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let title = "Обувь"
        static let startTop = 130
        static let startLead = 20
        static let stepTop = 173
        static let stepLead = 178
        static let ruble = "₽"
        static let priceOne = "2250"
        static let priceTwo = "4250"
        static let priceThree = "5750"
        static let priceFour = "3500"
        static let priceFive = "5750"
        static let nameImageOne = "blackHeels"
        static let nameImageTwo = "Blackshoes"
        static let nameImageThree = "pinkSneakers"
        static let nameImageFour = "yellowHeels"
        static let nameImageFive = "whiteSneakers"
        static let nameImageSix = "notEmptyBasket"
        static let nameImageSeven = "emptyBasket"
        static let shoeNameOne = "Туфли женские"
        static let shoeNameTwo = "Ботинки женские"
        static let shoeNameThree = "Кроссовки женские спортивные"
        static let shoeNameFour = "Туфли женские"
        static let shoeNameFive = "белые кросовки"
    }

    // MARK: - Private Properties

    var choosinLink: BasketViewController?

    // MARK: - Private Properties

    private let product = ProductView()
    private let info = [
        InformationAboutShoes(
            price: Constants.priceOne,
            shoeImage: Constants.nameImageOne,
            shoeName: Constants.shoeNameOne
        ),
        InformationAboutShoes(
            price: Constants.priceTwo,
            shoeImage: Constants.nameImageTwo,
            shoeName: Constants.shoeNameTwo
        ),
        InformationAboutShoes(
            price: Constants.priceThree,
            shoeImage: Constants.nameImageThree,
            shoeName: Constants.shoeNameThree
        ),
        InformationAboutShoes(
            price: Constants.priceFour,
            shoeImage: Constants.nameImageFour,
            shoeName: Constants.shoeNameFour
        ),
        InformationAboutShoes(
            price: Constants.priceFive,
            shoeImage: Constants.nameImageFive,
            shoeName: Constants.shoeNameFive
        ),
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addProduct()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .white
        title = Constants.title
        navigationController?.navigationBar.tintColor = .black
    }

    private func addProduct() {
        var top = Constants.startTop
        var lead = Constants.startLead
        for item in 0 ..< info.count {
            let products = ProductView()
            view.addSubview(products)
            products.basketButton.addTarget(self, action: #selector(putInBasket(button:)), for: .touchUpInside)
            products.translatesAutoresizingMaskIntoConstraints = false

            products.shoesImageView.image = UIImage(named: info[item].shoeImage)
            products.priceProductLabel.text = "\(info[item].price) \(Constants.ruble)"
            products.basketButton.tag = item

            products.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.3).isActive = true
            products.heightAnchor.constraint(equalTo: products.widthAnchor).isActive = true

            if item % 2 == 0 {
                products.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top)).isActive = true
                products.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(lead)).isActive = true
                lead += Constants.stepTop
            } else {
                products.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top)).isActive = true
                products.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(lead)).isActive = true
                lead -= Constants.stepLead
                top += Constants.stepTop
            }
        }
    }

    @objc func putInBasket(button: UIButton) {
        let modalViewController = ChoosingSizeViewController()
        let tag = button.tag
        let products = view.subviews[tag] as? ProductView
        modalViewController.basket = choosinLink

        if products?.basketButton.currentImage == UIImage(named: Constants.nameImageSix) {
            products?.basketButton.setImage(UIImage(named: Constants.nameImageSeven), for: .normal)
        } else {
            products?.basketButton.setImage(UIImage(named: Constants.nameImageSix), for: .normal)
        }

        present(modalViewController, animated: true, completion: nil)
    }
}
