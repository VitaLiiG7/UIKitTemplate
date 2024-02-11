// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для регистрации пользователя
final class RegistrationViewController: UIViewController {
    // MARK: - Private Properties

    // создание изображений
    private let cakeImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        image.image = UIImage(named: "cake")
        image.contentMode = .scaleAspectFit
        return image
    }()

    // создание лейблов
    private let birthdayReminderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        label.text = "Birthday \n Reminder"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(named: "color")
        return label
    }()

    private let signLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        label.text = "Sign in"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = UIColor(named: "labelColorTwo")
        return label
    }()

    private let emailLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 19, y: 318, width: 175, height: 19)
        label.text = "Email"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "labelColorTwo")
        return label
    }()

    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        label.text = "Password"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "labelColorTwo")
        return label
    }()

    private let faceIDLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 139, y: 544, width: 150, height: 35)
        label.text = "Use FaceID"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.isHidden = true
        return label
    }()

    // создание текстфилдов.
    private let typingEmailField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing email"
        textField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        return textField
    }()

    private let typingPasswordField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Typing password"
        textField.frame = CGRect(x: 20, y: 422, width: 129, height: 17)
        return textField
    }()

    // создание свитча
    private let faceIDswitch: UISwitch = {
        let faceIDswitch = UISwitch()
        faceIDswitch.frame = CGRect(x: 248, y: 544, width: 54, height: 35)
        faceIDswitch.setOn(true, animated: false)
        faceIDswitch.isHidden = true
        return faceIDswitch
    }()

    // создание линий
    private let lineOneView: CustomView = {
        let lineOneView = CustomView()
        lineOneView.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        return lineOneView
    }()

    private let lineTwoView: CustomView = {
        let lineOneView = CustomView()
        lineOneView.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        return lineOneView
    }()

    // создание кнопок
    private lazy var hidePasswordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "vector"), for: .normal)
        button.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        button.addTarget(self, action: #selector(hideButtonPressed), for: .touchUpInside)
        return button
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "labelColorTwo")
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 12
        button.isEnabled = false
        button.alpha = 0.5
        button.frame = CGRect(x: 20, y: 671, width: 350, height: 44)
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        for item in [
            cakeImageView, birthdayReminderLabel, signLabel,
            emailLabel, typingEmailField, passwordLabel,
            typingPasswordField, lineOneView, lineTwoView,
            hidePasswordButton, loginButton, faceIDLabel,
            faceIDswitch
        ] {
            view.addSubview(item)
        }

        view.backgroundColor = .white
        typingEmailField.delegate = self
        typingPasswordField.delegate = self
        typingPasswordField.isSecureTextEntry = true
    }

    @objc private func hideButtonPressed() {
        if hidePasswordButton.currentImage == UIImage(named: "vector") {
            hidePasswordButton.setImage(UIImage(named: "vectorOpen"), for: .normal)
            typingPasswordField.isSecureTextEntry = false
        } else {
            hidePasswordButton.setImage(UIImage(named: "vector"), for: .normal)
            typingPasswordField.isSecureTextEntry = true
        }
    }

    @objc private func loginButtonPressed() {
        navigationController?.pushViewController(BirthdayReminderViewController(), animated: true)
    }
}

// расширение для того чтобы скрывать и открывать пароль и фейсАйди
extension RegistrationViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let email = typingEmailField.text ?? ""
        let password = typingPasswordField.text ?? ""
        if email.count > 5, password.count > 5 {
            loginButton.isEnabled = true
            faceIDLabel.isHidden = false
            faceIDswitch.isHidden = false
            loginButton.alpha = 1
        }

        return true
    }
}
