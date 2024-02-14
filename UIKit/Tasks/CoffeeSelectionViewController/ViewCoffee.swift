// ViewCoffee.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс для отображения юайэлементов на экране заказа кофе
final class ViewCoffee: UIView {
    // MARK: - Visual Components

    let segmentControll: UISegmentedControl = {
        var segment = UISegmentedControl()
        segment = UISegmentedControl(items: ["Американо", "Капучино", "Латте"])
        segment.frame = CGRect(x: 15, y: 368, width: 345, height: 44)
        return segment
    }()

    let orderButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 717, width: 345, height: 53)
        button.backgroundColor = .order
        button.layer.cornerRadius = 12
        button.setTitle("Заказать", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        return button
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        label.text = "Цѣна - 100 руб"
        label.textAlignment = .right
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textColor = .black
        return label
    }()

    let ingredientsLabel = CoffeeModifierLabel(
        name: "Дополнительные ингредіенты",
        frame: CGRect(x: 195, y: 599, width: 165, height: 50)
    )

    let roastingLabel = CoffeeModifierLabel(
        name: "Темная \nобжарка",
        frame: CGRect(x: 15, y: 599, width: 165, height: 50)
    )

    let modificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 432, width: 200, height: 30)
        label.text = "Модификация"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textColor = .black
        return label
    }()

    let ingredientView: UIView = {
        let ingredient = UIView()
        ingredient.frame = CGRect(x: 15, y: 482, width: 165, height: 165)
        // Добавить в асет
        ingredient.backgroundColor = UIColor(red: 247 / 255.0, green: 247 / 255.0, blue: 247 / 255.0, alpha: 1)
        ingredient.layer.cornerRadius = 12
        ingredient.backgroundColor = .colour
        return ingredient
    }()

    let coffeeView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 195, y: 482, width: 165, height: 165)
        view.backgroundColor = UIColor(red: 247 / 255.0, green: 247 / 255.0, blue: 247 / 255.0, alpha: 1)
        view.layer.cornerRadius = 12
        view.backgroundColor = .colour
        return view
    }()

    let backgroundView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 375, height: 346)
        view.backgroundColor = .backgroundView
        view.layer.cornerRadius = 20
        return view
    }()

    let coffeeImageView: UIImageView = {
        let view = UIImageView()
        view.image = .coffee
        view.frame = CGRect(x: 112, y: 128, width: 150, height: 150)
        return view
    }()

    let darkRoastingImageView: UIImageView = {
        let view = UIImageView()
        view.image = .darkRoasting
        view.frame = CGRect(x: 46, y: 499, width: 100, height: 100)
        view.isUserInteractionEnabled = true
        return view
    }()

    var chooseIngredientsImageView: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 252, y: 528, width: 50, height: 50)
        view.image = .plus
        view.isUserInteractionEnabled = true
        return view
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        backgroundColor = .white
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupView() {
        [
            ingredientView,
            coffeeView,
            backgroundView,
            segmentControll,
            orderButton,
            coffeeImageView,
            priceLabel,
            roastingLabel,
            modificationLabel,
            ingredientsLabel,
            coffeeImageView,
            darkRoastingImageView,
            chooseIngredientsImageView
        ].forEach { addSubview($0) }
    }
}
