// ViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Вью Контроллер
final class ViewController: UIViewController {
    
    // MARK: - Private Properties
    private let pictureBackgroundView: UIImageView = {
        let pictureBackgroundView = UIImageView()
        pictureBackgroundView.image = UIImage(named: "picture background")
        pictureBackgroundView.contentMode = .scaleAspectFill
        pictureBackgroundView.frame = CGRect(x: 0, y: 50, width: 375, height: 775)
        return pictureBackgroundView
    }()
    
    private let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.backgroundColor = .colorWelcom
        nameLabel.frame = CGRect(x: 0, y: 49, width: 375, height: 82)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0
        nameLabel.font = .boldSystemFont(ofSize: 30)
        nameLabel.textColor = .white
        return nameLabel
    }()
    
    private lazy var additionbutton: UIButton = {
        let additionbutton = UIButton()
        additionbutton.frame = CGRect(x: 132, y: 507, width: 200, height: 200)
        additionbutton.backgroundColor = .additionbutton
        additionbutton.setTitle("Калькулятор", for: .normal)
        additionbutton.titleLabel?.textAlignment = .center
        additionbutton.titleLabel?.font = UIFont(name: "Verdana", size: 20)
        additionbutton.layer.cornerRadius = 30
        additionbutton.layer.borderWidth = 3
        additionbutton.layer.borderColor = UIColor(named: "calculator button frame")?.cgColor
        additionbutton.addTarget(self, action: #selector(calculateResult), for: .touchUpInside)
        return additionbutton
    }()
    
    private lazy var guessNumberbutton: UIButton = {
        let guessNumberbutton = UIButton()
        guessNumberbutton.frame = CGRect(x: 82, y: 301, width: 150, height: 150)
        guessNumberbutton.backgroundColor = .guessNumberbutton
        guessNumberbutton.setTitle("Угадай число", for: .normal)
        guessNumberbutton.titleLabel?.numberOfLines = 0
        guessNumberbutton.titleLabel?.textAlignment = .center
        guessNumberbutton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        guessNumberbutton.layer.cornerRadius = 30
        guessNumberbutton.layer.borderWidth = 3
        guessNumberbutton.layer.borderColor = UIColor(named: "guess number button")?.cgColor
        guessNumberbutton.addTarget(self, action: #selector(guessNumber), for: .touchUpInside)
        return guessNumberbutton
    }()
    
    @objc func calculateResult() {
        let alert = UIAlertController(title: "Введите ваши числа", message: nil, preferredStyle: .alert)
        let alertResult = UIAlertController(title: "Ваш результат", message: "", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "Ок", style: .default)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        var finalResult = 0
        let action = UIAlertAction(title: "Сложить", style: .cancel) { _ in
            if let texfield = alert.textFields {
                let result = (Int(texfield[0].text ?? "") ?? 0) + (Int(texfield[1].text ?? "") ?? 0)
                finalResult += result
            }
            
            alertResult.addAction(actionOk)
            alertResult.addAction(cancel)
            alertResult.message = "\(finalResult)"
            self.present(alertResult, animated: true, completion: nil)
        }
        
        alert.addTextField { texfield in
            texfield.placeholder = "Число 1"
        }
        
        alert.addTextField { texfield in
            texfield.placeholder = "Число 2"
        }
        
        alert.addAction(action)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
    @objc func guessNumber() {
        let alert = UIAlertController(title: "Угадай число от 1 до 10", message: nil, preferredStyle: .alert)
        let alertRezult = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Отмена", style: .default)
        let secondAllowAction = UIAlertAction(title: "Ок", style: .cancel)
        let allowAction = UIAlertAction(title: "Ок", style: .default) { _ in
            let randomNumber = Int.random(in: 1 ... 10)
            if let texfield = alert.textFields {
                let text = Int(texfield[0].text ?? "")
                if text == randomNumber {
                    alertRezult.title = "Поздравляю"
                    alertRezult.message = "Вы угадали"
                } else {
                    alertRezult.title = "Упс"
                    alertRezult.message = "Это неверный ответ"
                }
            }
            
            self.present(alertRezult, animated: true, completion: nil)
        }
        
        alert.addTextField { texfield in
            texfield.placeholder = "Введите число"
        }
        
        alertRezult.addAction(secondAllowAction)
        alert.addAction(cancel)
        alert.addAction(allowAction)
        present(alert, animated: true)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        welcomeAlert()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.isHidden = true
        setup()
    }
    
    // MARK: - Private Methods
    
    private func welcomeAlert() {
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
    
    private func setup() {
        view.addSubview(pictureBackgroundView)
        view.addSubview(additionbutton)
        view.addSubview(guessNumberbutton)
        view.addSubview(nameLabel)
    }
}
