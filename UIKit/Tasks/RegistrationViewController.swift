// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Вью Контроллер
final class RegistrationViewController: UIViewController {
    private let cakeImageView: UIImageView = {
        let cakeImageView = UIImageView()
        cakeImageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        cakeImageView.image = UIImage(named: "cake")
        cakeImageView.contentMode = .scaleAspectFit
        return cakeImageView
    }()

    private let birthdayReminderLabel: UILabel = {
        let birthdayReminderLabel = UILabel()
        birthdayReminderLabel.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        birthdayReminderLabel.text = "Birthday \n Reminder"
        birthdayReminderLabel.numberOfLines = 0
        birthdayReminderLabel.textAlignment = .center
        birthdayReminderLabel.font = UIFont.boldSystemFont(ofSize: 18)
        birthdayReminderLabel.textColor = UIColor(red: 90 / 255.0, green: 67 / 255.0, blue: 148 / 255.0, alpha: 1)
        return birthdayReminderLabel
    }()

    private let signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        signInLabel.text = "Sign in"
        signInLabel.font = UIFont.boldSystemFont(ofSize: 26)
        signInLabel.textColor = UIColor(red: 233 / 255.0, green: 70 / 255.0, blue: 94 / 255.0, alpha: 1)
        return signInLabel
    }()

    private let emailLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.frame = CGRect(x: 19, y: 318, width: 175, height: 19)
        signInLabel.text = "Email"
        signInLabel.font = UIFont.boldSystemFont(ofSize: 16)
        signInLabel.textColor = UIColor(red: 233 / 255.0, green: 70 / 255.0, blue: 94 / 255.0, alpha: 1)
        return signInLabel
    }()

    private let passwordLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        signInLabel.text = "Password"
        signInLabel.font = UIFont.boldSystemFont(ofSize: 16)
        signInLabel.textColor = UIColor(red: 233 / 255.0, green: 70 / 255.0, blue: 94 / 255.0, alpha: 1)
        return signInLabel
    }()

    private let faceIDLabel: UILabel = {
        let faceIDLabel = UILabel()
        faceIDLabel.frame = CGRect(x: 139, y: 544, width: 150, height: 35)
        faceIDLabel.text = "Use FaceID"
        faceIDLabel.font = .boldSystemFont(ofSize: 16)
        faceIDLabel.textColor = .black
        return faceIDLabel
    }()

    private let typingEmailField: UITextField = {
        let typingEmailField = UITextField()
        typingEmailField.placeholder = "Typing email"
        typingEmailField.frame = CGRect(x: 20, y: 347, width: 175, height: 17)
        return typingEmailField
    }()

    private let typingPasswordField: UITextField = {
        let typingPasswordField = UITextField()
        typingPasswordField.placeholder = "Typing password"
        typingPasswordField.frame = CGRect(x: 20, y: 422, width: 129, height: 17)
        return typingPasswordField
    }()

    private lazy var faceIDswitch: UISwitch = {
        let faceIDswitch = UISwitch()
        faceIDswitch.frame = CGRect(x: 248, y: 544, width: 54, height: 35)
        faceIDswitch.setOn(true, animated: false)
        return faceIDswitch
    }()

    private let lineOneView: UIView = {
        let lineOneView = UIView()
        lineOneView.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        lineOneView.backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
        return lineOneView
    }()

    private let lineTwoView: UIView = {
        let lineOneView = UIView()
        lineOneView.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        lineOneView.backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
        return lineOneView
    }()

    private lazy var hidePasswordButton: UIButton = {
        let hidePasswordBatton = UIButton()
        hidePasswordBatton.setImage(UIImage(named: "vector"), for: .normal)
        hidePasswordBatton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        hidePasswordBatton.addTarget(self, action: #selector(hideButtonPressed), for: .touchUpInside)
        return hidePasswordBatton
    }()

    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.backgroundColor = UIColor(red: 233 / 255.0, green: 70 / 255.0, blue: 94 / 255.0, alpha: 1)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.textColor = .white
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.layer.cornerRadius = 12
//        loginButtun.isEnabled = false
        loginButton.alpha = 0.5
        loginButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return loginButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        for item in [
            cakeImageView,
            birthdayReminderLabel,
            signInLabel,
            emailLabel,
            typingEmailField,
            passwordLabel,
            typingPasswordField, lineOneView, lineTwoView, hidePasswordButton, loginButton, faceIDLabel, faceIDswitch
        ] {
            view.addSubview(item)
        }

        view.backgroundColor = .white
        typingEmailField.delegate = self
        typingPasswordField.delegate = self
        typingPasswordField.isSecureTextEntry = true
    }

    @objc func hideButtonPressed() {
        if hidePasswordButton.currentImage == UIImage(named: "vector") {
            hidePasswordButton.setImage(UIImage(named: "vectorOpen"), for: .normal)
            typingPasswordField.isSecureTextEntry = false
        } else {
            hidePasswordButton.setImage(UIImage(named: "vector"), for: .normal)
            typingPasswordField.isSecureTextEntry = true
        }
    }

    @objc func loginButtonPressed() {
        navigationController?.pushViewController(BirthdayReminderViewController(), animated: true)
    }
}

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
            loginButton.alpha = 1
        }

        return true
    }
}
