// ProductView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс
class ProductView: UIView {
    // MARK: - Constants

    enum Constants {
        static let sizePrice = 10
        static let price = "2250 р"
    }

    // MARK: - Visual Components

    let shoesImageView: UIImageView = {
        let image = UIImageView()
        image.image = .blackHeels
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    let priceProductLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: ViewCatalog.Constants.fontVerdanaBold, size: CGFloat(Constants.sizePrice))
        label.text = Constants.price
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//    let basketImageView: UIImageView = {
//        let image = UIImageView()
//        image.image = .emptyBasket
//        image.contentMode = .scaleAspectFit
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.isUserInteractionEnabled = true
//        return image
//    }()

    let basketButton: UIButton = {
        let image = UIButton()
        image.setImage(.emptyBasket, for: .normal)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
        backgroundColor = .colorView
        layer.cornerRadius = 20
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupView() {
        addSubview(shoesImageView)
        addSubview(priceProductLabel)
        addSubview(basketButton)
    }

    func setupConstraints() {
        shoesImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 29).isActive = true
        shoesImageView.topAnchor.constraint(equalTo: topAnchor, constant: 29).isActive = true
        shoesImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoesImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        priceProductLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 85).isActive = true
        priceProductLabel.topAnchor.constraint(equalTo: topAnchor, constant: 133).isActive = true
        priceProductLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        priceProductLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

        basketButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 124).isActive = true
        basketButton.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        basketButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        basketButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
