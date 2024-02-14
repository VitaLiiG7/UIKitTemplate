// IngredientsView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// класс для выбора ингридиентов
final class IngredientsView: UIView {
    // MARK: - Constants

    enum Constants {
        static var additionalInformation = "Выберите дополнительные ингредіенты"
        static var milk = "Молоко "
        static var syrup = "Сироп "
        static var soyMilk = "Молоко соевое "
        static var almondMilkLabel = "Молоко миндальное "
        static var espresso = "Эспрессо 50мл "
    }

    let price = ["+50 руб", "+20 руб", "+50 руб", "+70 руб", "+50 руб"]

    // MARK: - Visual Components

    private let selectionIngredientsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.additionalInformation
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 40, y: 53, width: 294, height: 44)
        label.textColor = .black
        return label
    }()

    // MARK: - Visual Components

    let milkLabel = IngredientLabel(
        name: Constants.milk,
        frame: CGRect(x: 20, y: 124, width: 275, height: 35)
    )

    let syrupLabel = IngredientLabel(
        name: Constants.syrup,
        frame: CGRect(x: 20, y: 174, width: 275, height: 35)
    )

    let soyMilkLabel = IngredientLabel(
        name: Constants.soyMilk,
        frame: CGRect(x: 20, y: 224, width: 275, height: 35)
    )

    let almondMilkLabel = IngredientLabel(
        name: Constants.almondMilkLabel,
        frame: CGRect(x: 20, y: 274, width: 275, height: 35)
    )

    let espressoLabel = IngredientLabel(
        name: Constants.espresso,
        frame: CGRect(x: 20, y: 324, width: 275, height: 35)
    )

    let milkSwitch: UISwitch = {
        let faceIDswitch = UISwitch()
        faceIDswitch.frame = CGRect(x: 301, y: 124, width: 54, height: 35)
        faceIDswitch.setOn(false, animated: false)
        return faceIDswitch
    }()

    let syrupSwitch: UISwitch = {
        let faceIDswitch = UISwitch()
        faceIDswitch.frame = CGRect(x: 301, y: 174, width: 54, height: 35)
        faceIDswitch.setOn(false, animated: false)
        return faceIDswitch
    }()

    let soyMilkSwitch: UISwitch = {
        let faceIDswitch = UISwitch()
        faceIDswitch.frame = CGRect(x: 301, y: 224, width: 54, height: 35)
        faceIDswitch.setOn(false, animated: false)
        return faceIDswitch
    }()

    let almondMilkSwitch: UISwitch = {
        let faceIDswitch = UISwitch()
        faceIDswitch.frame = CGRect(x: 301, y: 274, width: 54, height: 35)
        faceIDswitch.setOn(false, animated: false)
        return faceIDswitch
    }()

    let espressoSwitch: UISwitch = {
        let faceIDswitch = UISwitch()
        faceIDswitch.frame = CGRect(x: 301, y: 324, width: 54, height: 35)
        faceIDswitch.setOn(false, animated: false)
        return faceIDswitch
    }()

    let closeScreenButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        button.setImage(.cross, for: .normal)
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func setupView() {
        [
            selectionIngredientsLabel,
            milkLabel,
            syrupLabel,
            soyMilkLabel,
            almondMilkLabel,
            espressoLabel,
            closeScreenButton,
            milkSwitch,
            syrupSwitch,
            soyMilkSwitch,
            almondMilkSwitch,
            espressoSwitch
        ].forEach { addSubview($0) }
    }
}
