// TipsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс оставить чаевые
final class TipsViewController: UIViewController {
    // MARK: - Private Methods

    @IBAction func leaveTipAction(_ sender: Any) {
        let alert = UIAlertController(
            title: "Спасибо за оставленные чаевые",
            message: "Будем рады Вас видеть снова",
            preferredStyle: .alert
        )

        let actionOk = UIAlertAction(title: "Ок", style: .cancel)
        alert.addAction(actionOk)
        present(alert, animated: true)
    }
}
