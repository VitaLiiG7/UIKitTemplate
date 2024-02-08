// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Вью Контроллер скрывает пароль
final class RegistrationViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet private var passwordField: UITextField!
    @IBOutlet var loginField: UITextField!
    @IBOutlet private var buttonTappedotlet: UIButton!

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
