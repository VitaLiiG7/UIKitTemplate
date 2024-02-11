// ChequeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс выводит заказ стола
final class ChequeViewController: UIViewController {
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

    // MARK: - Private Methods

    @IBAction func payCheckButton(_ sender: Any) {
        let alert = UIAlertController(title: "Вы хотите оплатить \nчек?", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        let actionOk = UIAlertAction(title: "Да", style: .default) { _ in
            self.performSegue(withIdentifier: "ChequeControllerTwo", sender: nil)
        }

        alert.addAction(cancel)
        alert.addAction(actionOk)
        alert.preferredAction = actionOk
        present(alert, animated: true)
    }
}
