// TableReservationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс lвыставление чека
final class TableReservationsViewController: UIViewController {
    // MARK: - Private Methods

    @IBAction private func issueInvoiceButton(_ sender: Any) {
        let alert = UIAlertController(title: "Выставить счет", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        let actionOk = UIAlertAction(title: "Чек", style: .default) { _ in
            self.performSegue(withIdentifier: "ChequeController", sender: nil)
        }

        alert.addAction(cancel)
        alert.addAction(actionOk)
        alert.preferredAction = actionOk
        present(alert, animated: true)
    }
}
