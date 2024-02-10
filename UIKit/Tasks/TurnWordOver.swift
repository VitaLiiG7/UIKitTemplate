// TurnWordOver.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для ввода слова
final class TurnWordOver: UIViewController {
    // MARK: - Private Properties

    private let userInterfaceView = UserInterfaceView()

    // MARK: - Life Cycle

    override func loadView() {
        view = userInterfaceView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pressButton()
        hideElements()
    }

    // MARK: - Private Methods

    private func hideElements() {
        userInterfaceView.leadWordLabel.isHidden = true
        userInterfaceView.resultLabel.isHidden = true
        userInterfaceView.invertedWordLabel.isHidden = true
        userInterfaceView.originalWordLabel.isHidden = true
    }

    private func pressButton() {
        userInterfaceView.startButton.addTarget(self, action: #selector(expandWord), for: .touchUpInside)
    }

    @objc private func expandWord() {
        let alert = UIAlertController(title: "Введите ваше слово", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        let actionOk = UIAlertAction(title: "Ок", style: .default) { _ in
            let model = ReversedWord()
            if let text = alert.textFields?[0].text {
                self.userInterfaceView.originalWordLabel.text = text
                self.userInterfaceView.invertedWordLabel.text = model.flipWord(text)
                self.userInterfaceView.leadWordLabel.isHidden = false
                self.userInterfaceView.resultLabel.isHidden = false
                self.userInterfaceView.invertedWordLabel.isHidden = false
                self.userInterfaceView.originalWordLabel.isHidden = false
                self.userInterfaceView.startButton.frame = CGRect(x: 20, y: 598, width: 335, height: 44)
            }
        }

        alert.addTextField { texfield in
            texfield.placeholder = "Введите слово"
        }

        alert.addAction(cancel)
        alert.addAction(actionOk)
        present(alert, animated: true)
    }
}
