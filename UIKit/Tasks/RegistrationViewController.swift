// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Вью Контроллер скрывает пароль
final class RegistrationViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var passwordField: UITextField!
    @IBOutlet var loginField: UITextField!
    @IBOutlet private var buttonTappedotlet: UIButton!
    @IBOutlet var enterButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        passwordField.delegate = self
        loginField.delegate = self
        enterButton.isEnabled = false
    }

    // MARK: - Private Methods

    @IBAction private func hidingButton(_ sender: Any) {
        if buttonTappedotlet.currentImage == UIImage(named: "VectorOpen") {
            buttonTappedotlet.setImage(UIImage(named: "Vector"), for: .normal)
            passwordField.isSecureTextEntry = true
        } else {
            buttonTappedotlet.setImage(UIImage(named: "VectorOpen"), for: .normal)
            passwordField.isSecureTextEntry = false
        }
    }
}

// MARK: - Extension

extension RegistrationViewController: UITextFieldDelegate {
    public func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let password = passwordField.text ?? ""
        let login = loginField.text ?? ""

        if password.count > 5, login.count > 5 {
            enterButton.isEnabled = true
        }

        return true
    }
}
