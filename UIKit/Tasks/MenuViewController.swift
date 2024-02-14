// MenuViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для выбора еды
final class MenuViewController: UIViewController {
    // MARK: - Visual Components

    private let letterGLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Г"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.frame = CGRect(x: 336, y: 242, width: 44, height: 16)
        return label
    }()

    private let guestAvatarImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 320, y: 230, width: 44, height: 44)
        image.image = UIImage(named: "letterG")
        return image
    }()

    private let cupWithCoffeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cupWithCoffe")
        image.frame = CGRect(x: 272, y: 685, width: 70, height: 70)
        return image
    }()

    private let cupImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "cup")
        image.frame = CGRect(x: 271, y: 605, width: 70, height: 44)
        return image
    }()

    private let pieImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pie")
        image.frame = CGRect(x: 270, y: 505, width: 70, height: 70)
        return image
    }()

    private let choseCoffeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Кофий", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        button.frame = CGRect(x: 5, y: 710, width: 180, height: 19)
        button.addTarget(self, action: #selector(pushToCheque), for: .touchUpInside)
        return button
    }()

    private let hotButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Горячiя напитки", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        button.frame = CGRect(x: 42, y: 620, width: 180, height: 19)
        return button
    }()

    private let pieButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Пти пате аля «РюсЪ»", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-BoldItalic", size: 16)
        button.frame = CGRect(x: 45, y: 530, width: 220, height: 19)
        return button
    }()

    private let backgroundTopButtonMenuImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rect")
        image.frame = CGRect(x: 21, y: 680, width: 335, height: 80)
        return image
    }()

    private let backgroundMiddleButtonImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "rect")
        image.frame = CGRect(x: 20, y: 590, width: 335, height: 80)
        return image
    }()

    private let backgroundBotButtonImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "variants")
        image.frame = CGRect(x: 20, y: 500, width: 335, height: 80)
        return image
    }()

    private let menuImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "menu")
        image.frame = CGRect(x: 120, y: 410, width: 125, height: 80)
        return image
    }()

    private let pointViewLabel: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "po")
        image.frame = CGRect(x: 320, y: 350, width: 20, height: 29)
        return image
    }()

    private let textLabelPointView: UILabel = {
        let label = UILabel()
        label.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        label.font = UIFont(name: "Verdana", size: 12)
        label.textColor = #colorLiteral(red: 0.6120845675, green: 0.6320224404, blue: 0.6574426293, alpha: 1)
        label.numberOfLines = 0
        label.frame = CGRect(x: 30, y: 360, width: 260, height: 30)
        return label
    }()

    private let geoPointLabel: UILabel = {
        let label = UILabel()
        label.text = "Адреса кофеен"
        label.font = UIFont(name: "Verdana-Bold", size: 12)
        label.frame = CGRect(x: 30, y: 340, width: 150, height: 15)
        return label
    }()

    private let geoPointImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "point")
        image.frame = CGRect(x: 20, y: 330, width: 335, height: 70)
        return image
    }()

    private let guestLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать, Гость"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textColor = #colorLiteral(red: 0.8953791261, green: 0.86565727, blue: 0.8402896523, alpha: 1)
        label.frame = CGRect(x: 20, y: 230, width: 185, height: 44)
        label.numberOfLines = 0
        return label
    }()

    private let cofeinovLabel: UIImageView = {
        let cofeinov = UIImageView()
        cofeinov.frame = CGRect(x: 100, y: 145, width: 165, height: 56)
        cofeinov.image = UIImage(named: "cofeinov")
        return cofeinov
    }()

    private let secondView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 300, width: 375, height: 564)
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        return view
    }()

    // MARK: - Private methods

    @objc private func pushToCheque() {
        let rootVC = ChequeViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        present(navVC, animated: true)
    }

    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.4726310968, green: 0.3272212744, blue: 0.1946154535, alpha: 1)
        view.addSubview(cofeinovLabel)
        view.addSubview(secondView)
        view.addSubview(guestLabel)
        view.addSubview(geoPointImageView)
        view.addSubview(geoPointLabel)
        view.addSubview(textLabelPointView)
        view.addSubview(pointViewLabel)
        view.addSubview(menuImageView)
        view.addSubview(backgroundTopButtonMenuImageView)
        view.addSubview(backgroundMiddleButtonImageView)
        view.addSubview(backgroundBotButtonImageView)
        view.addSubview(pieButton)
        view.addSubview(hotButton)
        view.addSubview(choseCoffeButton)
        view.addSubview(pieImageView)
        view.addSubview(cupImageView)
        view.addSubview(cupWithCoffeImageView)
        view.addSubview(guestAvatarImageView)
        view.addSubview(letterGLabel)
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
