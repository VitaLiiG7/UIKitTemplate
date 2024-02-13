// ChoiceRoastingViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для выбора обжарки зерен
class ChoiceRoastingViewController: UIViewController {
    // MARK: - Visual Components

    let modificationLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 40, y: 53, width: 294, height: 30)
        label.text = "Уточните обжарку зеренъ"
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
        return darkRoasting
    }()

    let lightRoastingImageView: UIImageView = {
        let lightRoasting = UIImageView()
        lightRoasting.image = .lightRoasting
        lightRoasting.frame = CGRect(x: 227, y: 119, width: 100, height: 100)
        return lightRoasting
    }()

    let darkRoastingLabel = CustomLabel(
        name: "Темная \nобжарка",
        frame: CGRect(x: 15, y: 219, width: 165, height: 50)
    )

    let lightRoastingLabel = CustomLabel(
        name: "Свѣтлая \nобжарка",
        frame: CGRect(x: 195, y: 219, width: 165, height: 50)
    )

    let coffeeLightView: UIView = {
        let coffee = UIView()
        coffee.frame = CGRect(x: 15, y: 102, width: 165, height: 165)
        coffee.backgroundColor = UIColor(red: 247 / 255.0, green: 247 / 255.0, blue: 247 / 255.0, alpha: 1)
        coffee.layer.cornerRadius = 12
        coffee.backgroundColor = .colour
        return coffee
    }()

    let coffeeDarkView: UIView = {
        let coffee = UIView()
        coffee.frame = CGRect(x: 195, y: 102, width: 165, height: 165)
        coffee.backgroundColor = UIColor(red: 247 / 255.0, green: 247 / 255.0, blue: 247 / 255.0, alpha: 1)
        coffee.layer.cornerRadius = 12
        coffee.backgroundColor = .colour
        return coffee
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
    }

    // MARK: - Private Methods

    private func setupView() {
        [
            coffeeDarkView coffeeLightView,

            modificationLabel,
            closeScreenButton,
            darkRoastingImageView,
            lightRoastingImageView,
            darkRoastingLabel,
            lightRoastingLabel,
        ].forEach { view.addSubview($0) }

        closeScreenButton.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
    }

    @objc private func closeScreen() {
        dismiss(animated: true)
    }
}
