// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс куда добавляются пользователи и информация о них
final class BirthdayReminderViewController: UIViewController {
    // MARK: - Constants

    // создание лейбла
    private let birthdayReminderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 78, y: 60, width: 209, height: 20)
        label.text = "Birthday Reminder"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()

    // создание изображения
    private let cakeImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 314, y: 119, width: 44, height: 44)
        image.image = UIImage(named: "cakeOne")
        return image
    }()

    // MARK: - Public Properties

    var people: [UserModel] = [
        UserModel(name: "Helena Link", age: "25!", image: "woman", dayBirthday: "10.03", tillBirthday: ""),
        UserModel(name: "Verona Tusk", age: "39", image: "womanOne", dayBirthday: "20.03", tillBirthday: "10 days"),
        UserModel(name: "Alex Smith", age: "51", image: "man", dayBirthday: "21.04", tillBirthday: "42 days"),
        UserModel(name: "Tom Johnson", age: "18", image: "boy", dayBirthday: "05.06", tillBirthday: "87 days"),
    ] {
        didSet { addUser() }
    }

    // MARK: - Private Properties

    private var delegate: InformationDelegate?

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addUser()
        setupNavigationItem()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(cakeImageView)
    }

    private func setupNavigationItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: .plus,
            style: .done,
            target: self,
            action: #selector(addReminder)
        )
    }

    // метод для установки местоположения пользователя
    private func addUser() {
        var startY = 94
        for person in people {
            createUser(person: person, sizeY: startY)
            startY += 95
        }
    }

    // метод для создания пользователя
    private func createUser(person: UserModel, sizeY: Int) {
        let userView = UserView()
        userView.thirdNameLabel.text = person.name
        userView.avatarImageView.image = UIImage(named: person.image)
        userView.dayBirthday.text = "\(person.dayBirthday) - turns \(person.age)"
        userView.tillBirthday.text = person.tillBirthday
        userView.frame = CGRect(x: 20, y: sizeY, width: 335, height: 94)
        view.addSubview(userView)
    }

    @objc private func addReminder() {
        let modalViewController = InformationAboutPersonViewController()
        modalViewController.delegate = self
        present(modalViewController, animated: true, completion: nil)
    }
}

// расширение для получения информации с другого экрана
extension BirthdayReminderViewController: InformationDelegate {
    func transferInformation(_ user: UserModel) {
        people.append(user)
    }
}
