// BasketViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран корзина, сюда прихоидт выбранный товар ( делает коллега )
class BasketViewController: UIViewController {
    var priceTestLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "EEEE"
        label.textAlignment = .left
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        return label
    }()

    var testImageView: UIImageView = {
        let image = UIImageView()
        image.image = .blackHeels
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 50, y: 150, width: 50, height: 50)
        return image
    }()

    var testnameImageView: UIImageView = {
        let image = UIImageView()
        image.image = .blackHeels
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 50, y: 300, width: 50, height: 50)
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(priceTestLabel)
        view.addSubview(testImageView)
        view.addSubview(testnameImageView)
        let example = ChoosingShoesViewController()
        example.delegate = self
    }
}

extension BasketViewController: InformationDelegate {
    func sendInformation(info: InformationAboutShoes) {
        priceTestLabel.text = info.price
        testImageView.image = UIImage(named: info.shoeImage)
        testnameImageView.image = UIImage(named: info.shoeName)
        print("PRISHLO")
    }
}
