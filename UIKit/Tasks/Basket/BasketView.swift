// BasketView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// view
class BasketView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let womanShoes = "Женские ботинки"
        static let basket = "Корзина"
        static let boldFont = "Verdana-Bold"
        static let font = "Verdana"
        static let countOfShoes = "Количество"
        static let size = "Размер"
        static let price = "Цена"
        static let numberShoesDefault = "1"
        static let totalPrice = "4250 ₽"
        static let checkoutButton = "Оформить заказ - 4250 ₽"
        static let mediumSize = 16
        static let minSize = 12
        static let cornerRadius = 12
    }

    private let numberOfShoes: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.numberShoesDefault
        label.font = UIFont(name: Constants.font, size: CGFloat(Constants.minSize))
        return label
    }()

    let totalLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.totalPrice
        label.font = UIFont(name: Constants.boldFont, size: CGFloat(Constants.minSize))
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.price
        label.font = UIFont(name: Constants.font, size: CGFloat(Constants.minSize))
        return label
    }()

    private let thirtyNineSizeButton: UIButton = {
        let button = UIButton()
        button.setTitle("39", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9788053632, green: 0.919518292, blue: 0.9593327641, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: Constants.font, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let thirtyEightSizeButton: UIButton = {
        let button = UIButton()
        button.setTitle("38", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9788053632, green: 0.919518292, blue: 0.9593327641, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: Constants.font, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let thirtySevenSizeButton: UIButton = {
        let button = UIButton()
        button.setTitle("37", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9788053632, green: 0.919518292, blue: 0.9593327641, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: Constants.font, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let thirtySixSizeButton: UIButton = {
        let button = UIButton()
        button.setTitle("36", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9788053632, green: 0.919518292, blue: 0.9593327641, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: Constants.font, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let thirtyFiveSizeButton: UIButton = {
        let button = UIButton()
        button.setTitle("35", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9788053632, green: 0.919518292, blue: 0.9593327641, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: Constants.font, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let sizeOfShoesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.size
        label.font = UIFont(name: Constants.font, size: CGFloat(Constants.minSize))
        return label
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9788053632, green: 0.919518292, blue: 0.9593327641, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: Constants.font, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(actionPlusButton), for: .touchUpInside)
        return button
    }()

    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9788053632, green: 0.919518292, blue: 0.9593327641, alpha: 1)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: Constants.font, size: 10)
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(actionMinusButton), for: .touchUpInside)
        return button
    }()

    private let countOfShoesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.countOfShoes
        label.font = UIFont(name: Constants.font, size: CGFloat(Constants.minSize))
        return label
    }()

    private let womanShoesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.womanShoes
        label.font = UIFont(name: Constants.font, size: CGFloat(Constants.minSize))
        return label
    }()

    let shoesImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "blackShoes")
        return image
    }()

    private let basketButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.baskeet, for: .normal)
        return button
    }()

    private let viewForShoes: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        view.layer.cornerRadius = CGFloat(Constants.cornerRadius)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        addSubview(viewForShoes)
        setupViewForShoes()
        addSubview(basketButton)
        setupBasketButton()
        addSubview(shoesImage)
        setupShoesImage()
        addSubview(womanShoesLabel)
        setupWomanShoesLabel()
        addSubview(countOfShoesLabel)
        setupCountOfShoesLabel()
        addSubview(minusButton)
        setupMinusButton()
        addSubview(plusButton)
        setupPlusButton()
        addSubview(sizeOfShoesLabel)
        setupSizeOfShoes()
        addSubview(thirtyFiveSizeButton)
        setupThirtyFiveSizeButton()
        addSubview(thirtySixSizeButton)
        setupThirtySixSizeButton()
        addSubview(thirtySevenSizeButton)
        setupThirtySevenSizeButton()
        addSubview(thirtyEightSizeButton)
        setupThirtyEightSizeButton()
        addSubview(thirtyNineSizeButton)
        setupThirtyNineSizeButton()
        addSubview(priceLabel)
        setupPriceLabel()
        addSubview(totalLabel)
        setupTotalLabel()
        addSubview(numberOfShoes)
        setupNumberOfShoes()
        backgroundColor = .white
    }

    private func setupNumberOfShoes() {
        numberOfShoes.widthAnchor.constraint(equalToConstant: 17).isActive = true
        numberOfShoes.heightAnchor.constraint(equalToConstant: 15).isActive = true
        numberOfShoes.leftAnchor.constraint(equalTo: leftAnchor, constant: 315).isActive = true
        numberOfShoes.topAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
    }

    private func setupTotalLabel() {
        totalLabel.widthAnchor.constraint(equalToConstant: 63).isActive = true
        totalLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
        totalLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 310).isActive = true
        totalLabel.topAnchor.constraint(equalTo: topAnchor, constant: 310).isActive = true
    }

    private func setupPriceLabel() {
        priceLabel.widthAnchor.constraint(equalToConstant: 32).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 200).isActive = true
        priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: 310).isActive = true
    }

    private func setupThirtyNineSizeButton() {
        thirtyNineSizeButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
        thirtyNineSizeButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        thirtyNineSizeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 200).isActive = true
        thirtyNineSizeButton.topAnchor.constraint(equalTo: topAnchor, constant: 285).isActive = true
    }

    private func setupThirtyEightSizeButton() {
        thirtyEightSizeButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
        thirtyEightSizeButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        thirtyEightSizeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 320).isActive = true
        thirtyEightSizeButton.topAnchor.constraint(equalTo: topAnchor, constant: 260).isActive = true
    }

    private func setupThirtySevenSizeButton() {
        thirtySevenSizeButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
        thirtySevenSizeButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        thirtySevenSizeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 280).isActive = true
        thirtySevenSizeButton.topAnchor.constraint(equalTo: topAnchor, constant: 260).isActive = true
    }

    private func setupThirtySixSizeButton() {
        thirtySixSizeButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
        thirtySixSizeButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        thirtySixSizeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 240).isActive = true
        thirtySixSizeButton.topAnchor.constraint(equalTo: topAnchor, constant: 260).isActive = true
    }

    private func setupThirtyFiveSizeButton() {
        thirtyFiveSizeButton.widthAnchor.constraint(equalToConstant: 31).isActive = true
        thirtyFiveSizeButton.heightAnchor.constraint(equalToConstant: 17).isActive = true
        thirtyFiveSizeButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 200).isActive = true
        thirtyFiveSizeButton.topAnchor.constraint(equalTo: topAnchor, constant: 260).isActive = true
    }

    private func setupSizeOfShoes() {
        sizeOfShoesLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        sizeOfShoesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        sizeOfShoesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 200).isActive = true
        sizeOfShoesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 240).isActive = true
    }

    private func setupPlusButton() {
        plusButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        plusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 340).isActive = true
        plusButton.topAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
    }

    private func setupMinusButton() {
        minusButton.widthAnchor.constraint(equalToConstant: 15).isActive = true
        minusButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        minusButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 280).isActive = true
        minusButton.topAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
    }

    private func setupCountOfShoesLabel() {
        countOfShoesLabel.widthAnchor.constraint(equalToConstant: 72).isActive = true
        countOfShoesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        countOfShoesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 200).isActive = true
        countOfShoesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 200).isActive = true
    }

    private func setupWomanShoesLabel() {
        womanShoesLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true
        womanShoesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        womanShoesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 200).isActive = true
        womanShoesLabel.topAnchor.constraint(equalTo: topAnchor, constant: 160).isActive = true
    }

    private func setupShoesImage() {
        shoesImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        shoesImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        shoesImage.leftAnchor.constraint(equalTo: leftAnchor, constant: 60).isActive = true
        shoesImage.topAnchor.constraint(equalTo: topAnchor, constant: 170).isActive = true
    }

    private func setupBasketButton() {
        basketButton.widthAnchor.constraint(equalToConstant: 20).isActive = true
        basketButton.heightAnchor.constraint(equalToConstant: 19).isActive = true
        basketButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 160).isActive = true
        basketButton.topAnchor.constraint(equalTo: topAnchor, constant: 160).isActive = true
    }

    private func setupViewForShoes() {
        viewForShoes.widthAnchor.constraint(equalToConstant: 157).isActive = true
        viewForShoes.heightAnchor.constraint(equalToConstant: 157).isActive = true
        viewForShoes.leftAnchor.constraint(equalTo: leftAnchor, constant: 30).isActive = true
        viewForShoes.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
    }

//    @objc private func actionPlusButton() {
//        numberOfShoes.text = "2"
//        totalLabel.text = "8500 ₽"
//        checkoutButton.setTitle("Оформить заказ - 8500 ₽", for: .normal)
//    }
//
//    @objc private func actionMinusButton() {
//        numberOfShoes.text = "1"
//        totalLabel.text = "4250 ₽"
//        checkoutButton.setTitle("Оформить заказ - 4250 ₽", for: .normal)
//    }
}
