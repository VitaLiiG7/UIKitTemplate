// ThanksViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс успешного заказа
final class ThanksViewController: UIViewController {
    // MARK: - Visual Components

    private let cancelCrossButtonImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "crossButton")
        image.frame = CGRect(x: 20, y: 60, width: 14, height: 14)
        return image
    }()

    private let shareLabel: UILabel = {
        let label = UILabel()
        label.text = """
        Разскажи о насъ другу, отправь ему промокодъ на безплатный напитокъ и получи скидку 10% на слѣдующій заказъ.
        """

        label.font = UIFont(name: "Verdana", size: 16)
        label.textColor = #colorLiteral(red: 0.5294118524, green: 0.5294118524, blue: 0.5294118524, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.frame = CGRect(x: 35, y: 440, width: 315, height: 89)
        return label
    }()

    private let thanksForOrderImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "thanksForOrder")
        image.frame = CGRect(x: 85, y: 250, width: 235, height: 128)
        return image
    }()

    private let topImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "topVenzel")
        image.frame = CGRect(x: 92, y: 100, width: 200, height: 86)
        return image
    }()

    private let moveTransitionButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Хорошо", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.3505194485, green: 0.7462534308, blue: 0.779846251, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        button.layer.cornerRadius = 12
        button.frame = CGRect(x: 20, y: 650, width: 345, height: 53)
        button.addTarget(self, action: #selector(transitionAction), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private methods

    @objc private func transitionAction() {
        let rootVC = MenuViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(topImage)
        view.addSubview(thanksForOrderImageView)
        view.addSubview(shareLabel)
        view.addSubview(moveTransitionButton)
        view.addSubview(cancelCrossButtonImage)
    }
}
