// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для авторизации пользователя
final class AuthorizationViewController: UIViewController {
    // MARK: - Constants

    private let eyeImage: UIImageView = {
        var image = UIImageView()
        image.frame = CGRect(x: 335, y: 505, width: 22, height: 19)
        image.image = UIImage(named: "eye")
        return image
    }()

    private let grayLineLogin: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 20, y: 460, width: 335, height: 1)
        image.backgroundColor = UIColor.systemGray3
        return image
    }()

    private let grayLinePassword: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 20, y: 530, width: 335, height: 1)
        image.backgroundColor = UIColor.systemGray3
        return image
    }()

    private let enterButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 12, y: 650, width: 335, height: 44)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.backgroundColor = #colorLiteral(red: 0.3498099744, green: 0.7441686988, blue: 0.7795379758, alpha: 1)
        button.layer.cornerRadius = 12
        button.alpha = 0.5
        button.isEnabled = false
        button.addTarget(self, action: #selector(pushToMenuController), for: .touchUpInside)
        return button
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль"
        label.frame = CGRect(x: 20, y: 480, width: 175, height: 19)
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        return label
    }()

    private let loginLabel: UILabel = {
        let label = UILabel()
        label.text = "Логин"
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.frame = CGRect(x: 20, y: 410, width: 175, height: 19)
        return label
    }()

    private let authorizationLabel: UILabel = {
        let label = UILabel()
        label.text = "Авторизация"
        label.font = UIFont(name: "Verdana-Bold", size: 26)
        label.frame = CGRect(x: 20, y: 350, width: 195, height: 31)
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

    // MARK: - Variables

    private lazy var loginTextField: UITextField = {
        let tfield = UITextField()
        tfield.frame = CGRect(x: 20, y: 440, width: 175, height: 17)
        tfield.placeholder = "Введите почту"
        tfield.addTarget(self, action: #selector(changePassword), for: .editingChanged)
        return tfield
    }()

    private lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.frame = CGRect(x: 20, y: 510, width: 175, height: 17)
        tf.placeholder = "Введите пароль"
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(changePassword), for: .editingChanged)
        return tf
    }()

    // метод реализующий скрытие кнопки пока ТФ не заполнены
    @objc private func changePassword() {
        if (passwordTextField.text?.isEmpty ?? false) ||
            (loginTextField.text?.isEmpty ?? false)
        {
            enterButton.isEnabled = false
            enterButton.alpha = 0.5
        } else {
            enterButton.isEnabled = true
            enterButton.alpha = 1
        }
    }

    @objc private func pushToMenuController() {
        let rootVC = MenuViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }

    // MARK: - SetupUI

    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.4726310968, green: 0.3272212744, blue: 0.1946154535, alpha: 1)
        view.addSubview(cofeinovLabel)
        view.addSubview(secondView)
        view.addSubview(authorizationLabel)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(enterButton)
        view.addSubview(grayLinePassword)
        view.addSubview(grayLineLogin)
        view.addSubview(eyeImage)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4726310968, green: 0.3272212744, blue: 0.1946154535, alpha: 1)
        setupUI()
    }
}
