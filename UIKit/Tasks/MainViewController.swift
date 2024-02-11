// MainViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Главный экран приложения с кнопками начала игры "угадай число" и калькулятора
final class MainViewController: UIViewController {
    // MARK: - Private Properties

    private let pictureBackgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "pictureBackground")
        view.contentMode = .scaleAspectFill
        view.frame = CGRect(x: 0, y: 50, width: 380, height: 760)
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .colorWelcome
        label.frame = CGRect(x: 0, y: 49, width: 380, height: 82)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        return label
    }()

    // MARK: - Public Properties

    private var calcButton: CustomButton = {
        let button = CustomButton()
        button.frame = CGRect(x: 132, y: 507, width: 200, height: 200)
        button.backgroundColor = .additionbutton
        button.setTitle("Калькулятор", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 20)
        button.layer.borderColor = UIColor(named: "calculatorButtonFrame")?.cgColor
        return button
    }()

    private var guessNumberButton: CustomButton = {
        let button = CustomButton()
        button.frame = CGRect(x: 82, y: 301, width: 150, height: 150)
        button.backgroundColor = .guessNumberbutton
        button.setTitle("Угадай число", for: .normal)
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 25)
        button.layer.borderColor = UIColor(named: "guessNumberButton")?.cgColor
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidAppear(_ animated: Bool) {
        showWelcomeAlert()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.isHidden = true
        setupViews()
    }

    // MARK: - Private Methods

    @objc private func calculateResult() {
        let alert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)
        let alertResult = UIAlertController(title: "Ваш результат", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ок", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        var finalResult = 0
        let foldAction = UIAlertAction(title: "Сложить", style: .default) { [weak self] _ in
            if let textField = alert.textFields {
                finalResult = (Int(textField[0].text ?? "") ?? 0) + (Int(textField[1].text ?? "") ?? 0)
            }
            
            alertResult.addAction(cancelAction)
            alertResult.addAction(okAction)
            alertResult.message = "\(finalResult)"
            self?.present(alertResult, animated: true)
        }

        alert.addTextField { texfield in
            texfield.placeholder = "Число 1"
        }

        alert.addTextField { texfield in
            texfield.placeholder = "Число 2"
        }

        alert.addAction(foldAction)
        alert.addAction(cancelAction)
        alert.preferredAction = foldAction
        present(alert, animated: true)
    }

    @objc private func guessNumber() {
        let alert = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        let resultAlert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
        let secondOkAction = UIAlertAction(title: "Ок", style: .cancel)
        let guessNumberAction = UIAlertAction(title: "Ок", style: .default) { _ in
            let randomNumber = Int.random(in: 1 ... 10)
            if let textField = alert.textFields {
                let text = Int(textField[0].text ?? "")
                if text == randomNumber {
                    resultAlert.title = "Поздравляю"
                    resultAlert.message = "Вы угадали"
                } else {
                    resultAlert.title = "Упс"
                    resultAlert.message = "Это неверный ответ"
                }
            }

            self.present(resultAlert, animated: true)
        }

        alert.addTextField { texfield in
            texfield.placeholder = "Введите число"
        }

        resultAlert.addAction(secondOkAction)
        alert.addAction(cancelAction)
        alert.addAction(guessNumberAction)
        present(alert, animated: true)
    }

    private func showWelcomeAlert() {
        let alert = UIAlertController(title: "Пожалуйста, \n представьтесь", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Готово", style: .default) { _ in
            if let text = alert.textFields?.first {
                self.nameLabel.text = "Приветствую, \n \(text.text ?? "")!"
                self.nameLabel.isHidden = false
            }
        }

        alert.addTextField { UITextField in
            UITextField.placeholder = "Введите ваше имя"
        }

        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

    private func setupViews() {
        view.addSubview(pictureBackgroundView)
        view.addSubview(calcButton)
        view.addSubview(guessNumberButton)
        view.addSubview(nameLabel)
        guessNumberButton.addTarget(self, action: #selector(guessNumber), for: .touchUpInside)
        calcButton.addTarget(self, action: #selector(calculateResult), for: .touchUpInside)
    }
}
