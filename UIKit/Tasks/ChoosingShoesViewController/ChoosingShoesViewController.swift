// ChoosingShoesViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol InformationDelegate: AnyObject {
    func sendInformation(info: InformationAboutShoes)
}

/// Экран для выбора размера обуви
class ChoosingShoesViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let title = "Обувь"
    }

    weak var delegate: InformationDelegate?

    private var items = [
        Product(price: "2250 р", productImage: "blackHeels", basketImage: "emptyBasket"),
        Product(price: "4250 р", productImage: "Blackshoes", basketImage: "emptyBasket"),
        Product(price: "5750 р", productImage: "pinkSneakers", basketImage: "emptyBasket"),
        Product(price: "3500 р", productImage: "yellowHeels", basketImage: "emptyBasket"),
        Product(price: "5750 р", productImage: "whiteSneakers", basketImage: "emptyBasket"),
    ] {
        didSet {
            addProduct()
        }
    }

    let info = [
        InformationAboutShoes(price: "2250 р", shoeImage: "blackHeels", shoeName: "Туфли женские"),
        InformationAboutShoes(price: "4250 р", shoeImage: "Blackshoes", shoeName: "Ботинки женские"),
        InformationAboutShoes(price: "5750 р", shoeImage: "pinkSneakers", shoeName: "Кроссовки женские спортивные"),
        InformationAboutShoes(price: "3500 р", shoeImage: "yellowHeels", shoeName: "Туфли женские"),
        InformationAboutShoes(price: "5750 р", shoeImage: "whiteSneakers", shoeName: "белые кросовки"),
    ]

    let info1: [String] = ["Jopa", "Mashina"]
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        addProduct()
        view.backgroundColor = .white
        title = Constants.title
    }

    func addProduct() {
        var top = 130
        var left = 20
        for item in 0 ..< items.count {
            let products = ProductView()
            view.addSubview(products)
            products.basketButton.addTarget(self, action: #selector(putInBasket(button:)), for: .touchUpInside)

            products.translatesAutoresizingMaskIntoConstraints = false
            products.shoesImageView.image = UIImage(named: items[item].productImage)
            products.priceProductLabel.text = "\(items[item].price)"
            products.basketButton.tag = item
            products.widthAnchor.constraint(equalToConstant: view.bounds.width / 2.3).isActive = true
            products.heightAnchor.constraint(equalTo: products.widthAnchor).isActive = true
            if item % 2 == 0 {
                products.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top)).isActive = true
                products.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(left)).isActive = true
                left += 178
            } else {
                products.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(top)).isActive = true
                products.leftAnchor.constraint(equalTo: view.leftAnchor, constant: CGFloat(left)).isActive = true
                left -= 178
                top += 173
            }
        }
    }

    var number: [Int] = []

    @objc func putInBasket(button: UIButton) {
        let modalViewController = ChoosingSizeViewController()
//        let tag = button.tag
//        _ = info[button.tag]
//        delegate?.sendInformation(info: info[tag])
        
        let tag = button.tag
         let selectedInfo = info1[button.tag] // Получение выбранной информации
//        delegate?.sendInformation(info: selectedInfo)


//        let info = InformationAboutShoes(price: info.price, shoeImage: im, shoeName: )
//        delegate?.sendInformation(info: InformationAboutShoes)
        modalViewController.delegate = self
        present(modalViewController, animated: true, completion: nil)
    }
}

extension ChoosingShoesViewController: SizeDelegate {
    func transferShoeSize(size: Int) {
        number.append(size)
    }
}
