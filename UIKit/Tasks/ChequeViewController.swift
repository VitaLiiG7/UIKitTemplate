// ChequeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для выдачи чека
final class ChequeViewController: UIViewController {
    // MARK: - Visual Components

    private let espressoPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "50 руб"
        label.font = UIFont(name: "Verdana", size: 16)
        label.frame = CGRect(x: 280, y: 300, width: 130, height: 30)
        return label
    }()

    private let milkPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "50 руб"
        label.font = UIFont(name: "Verdana", size: 16)
        label.frame = CGRect(x: 280, y: 260, width: 130, height: 30)
        return label
    }()

    private let americanoPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "100 руб"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 280, y: 220, width: 140, height: 30)
        return label
    }()

    private let venzelImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "venzelLast")
        image.frame = CGRect(x: 130, y: 490, width: 100, height: 40)
        return image
    }()

    private let totalLabel: UILabel = {
        let label = UILabel()
        label.text = "Цѣна - 200 руб"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 100, y: 450, width: 231, height: 30)
        return label
    }()

    private let espresso50mlLabel: UILabel = {
        let label = UILabel()
        label.text = "Эспрессо 50мл"
        label.font = UIFont(name: "Verdana", size: 16)
        label.frame = CGRect(x: 20, y: 300, width: 150, height: 30)
        return label
    }()

    private let milkLabel: UILabel = {
        let label = UILabel()
        label.text = "Молоко"
        label.font = UIFont(name: "Verdana", size: 16)
        label.frame = CGRect(x: 20, y: 260, width: 150, height: 30)
        return label
    }()

    private let americanoLabel: UILabel = {
        let label = UILabel()
        label.text = "Американо"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 20, y: 220, width: 140, height: 30)
        return label
    }()

    private let bilLabel: UILabel = {
        let label = UILabel()
        label.text = "Вашъ Заказъ"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 120, y: 180, width: 140, height: 30)
        return label
    }()

    private let venzelRight: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "venzelRight")
        image.frame = CGRect(x: 260, y: 120, width: 100, height: 72)
        return image
    }()

    private let venzelLeft: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "venzelLeft")
        image.frame = CGRect(x: 20, y: 120, width: 100, height: 72)
        return image
    }()

    private let payButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Оплатить", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3505194485, green: 0.7462534308, blue: 0.779846251, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 12, y: 650, width: 345, height: 53)
        button.addTarget(self, action: #selector(payButtonAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    @objc private func payButtonAction() {
        let destinationViewController = ThanksViewController()
        let navigationController = UINavigationController(rootViewController: destinationViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(venzelLeft)
        view.addSubview(venzelRight)
        view.addSubview(bilLabel)
        view.addSubview(americanoLabel)
        view.addSubview(milkLabel)
        view.addSubview(espresso50mlLabel)
        view.addSubview(totalLabel)
        view.addSubview(venzelImageView)
        view.addSubview(payButton)
        view.addSubview(americanoPriceLabel)
        view.addSubview(milkPriceLabel)
        view.addSubview(espressoPriceLabel)
    }
}
