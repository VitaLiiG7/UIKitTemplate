// ChoiceRoastingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// протокол Делегата для передачи информации
protocol CoffeeRoastDelegate: AnyObject {
    // метод который передает информацию изображение обжарки кофе и его название
    func changeRoasting(roasting: CoffeeAndIngredients)
}

/// Экрна для выбора обжарки зерен
final class ChoiceRoastingViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let specifyRoasting = "Уточните обжарку зеренъ"
        static let darkRoasting = "Темная \nобжарка"
        static let lightRoasting = "Светлая \nобжарка"
        static let darkRoastingImage = "darkRoasting"
        static let lightRoastingImage = "lightRoasting"
    }

    // MARK: - Visual Components

    var nameRoast = ""
    var imageRoast = ""
    private let tapGestureCoffee = UITapGestureRecognizer()
    private let tapGestureIngredients = UITapGestureRecognizer()

    let modificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 53, width: 294, height: 30)
        label.text = Constants.specifyRoasting
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()

    let closeScreenButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        button.setImage(.cross, for: .normal)
        return button
    }()

    let darkRoastingImageView: UIImageView = {
        let darkRoasting = UIImageView()
        darkRoasting.image = .darkRoasting
        darkRoasting.frame = CGRect(x: 46, y: 119, width: 100, height: 100)
        darkRoasting.isUserInteractionEnabled = true
        return darkRoasting
    }()

    let lightRoastingImageView: UIImageView = {
        let lightRoasting = UIImageView()
        lightRoasting.image = .lightRoasting
        lightRoasting.frame = CGRect(x: 227, y: 119, width: 100, height: 100)
        lightRoasting.isUserInteractionEnabled = true
        return lightRoasting
    }()

    let darkRoastingLabel = CoffeeModifierLabel(
        name: Constants.darkRoasting,
        frame: CGRect(x: 15, y: 219, width: 165, height: 50)
    )

    let lightRoastingLabel = CoffeeModifierLabel(
        name: Constants.lightRoasting,
        frame: CGRect(x: 195, y: 219, width: 165, height: 50)
    )

    let darkCoffeeView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 15, y: 102, width: 165, height: 165)
        view.layer.cornerRadius = 12
        view.backgroundColor = .colour
        return view
    }()

    let lightCoffeeView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 195, y: 102, width: 165, height: 165)
        view.layer.cornerRadius = 12
        view.backgroundColor = .colour
        return view
    }()

    // MARK: - Public Properties

    weak var delegate: CoffeeRoastDelegate?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    // MARK: - Private Methods

    private func setupView() {
        [
            darkCoffeeView,
            lightCoffeeView,
            modificationLabel,
            closeScreenButton,
            darkRoastingImageView,
            lightRoastingImageView,
            darkRoastingLabel,
            lightRoastingLabel,
        ].forEach { view.addSubview($0) }

        view.backgroundColor = .white
        closeScreenButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        tapGestureCoffee.addTarget(self, action: #selector(chooseDarkRoast))
        tapGestureIngredients.addTarget(self, action: #selector(chooseLightRoast))
        darkRoastingImageView.addGestureRecognizer(tapGestureCoffee)
        lightRoastingImageView.addGestureRecognizer(tapGestureIngredients)
    }

    @objc func chooseDarkRoast() {
        darkCoffeeView.layer.borderWidth = 4
        lightCoffeeView.layer.borderWidth = 0
        darkCoffeeView.layer.borderColor = UIColor(red: 89 / 255.0, green: 190 / 255.0, blue: 199 / 255.0, alpha: 1)
            .cgColor
        imageRoast = Constants.darkRoastingImage
        nameRoast = Constants.darkRoasting
    }

    @objc func chooseLightRoast() {
        lightCoffeeView.layer.borderWidth = 4
        darkCoffeeView.layer.borderWidth = 0
        lightCoffeeView.layer.borderColor = UIColor(
            red: 89 / 255.0,
            green: 190 / 255.0,
            blue: 199 / 255.0,
            alpha: 1
        )
        .cgColor
        imageRoast = Constants.lightRoastingImage
        nameRoast = Constants.lightRoasting
    }

    @objc private func closeScreen() {
        let coffeeMapdict = CoffeeAndIngredients(coffeeMap: [nameRoast: imageRoast])
        delegate?.changeRoasting(roasting: coffeeMapdict)
        dismiss(animated: true)
    }
}
