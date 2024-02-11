// BirthdayReminderViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс
class BirthdayReminderViewController: UIViewController {
    //    private lazy var addPersonButtun: UIButton = {
    //        let addPersonButtun = UIButton(type: .system)
    //        addPersonButtun.setImage(UIImage(systemName: "plus"), for: .normal)
    //        addPersonButtun.frame = CGRect(x: 347, y: 152, width: 16, height: 16)
    //        addPersonButtun.addTarget(self, action: #selector(addButtun), for: .touchUpInside)
    //        return addPersonButtun
    //    }()
    // Лейблы
    var people: [UserModel] = [
        UserModel(name: "Helena Link", age: "25!", image: "woman", dayTillBirthday: "10.03", tillBirthday: ""),
        UserModel(name: "Verona Tusk", age: "39", image: "womanOne", dayTillBirthday: "20.03", tillBirthday: "10 days"),
        UserModel(name: "Alex Smith", age: "51", image: "man", dayTillBirthday: "21.04", tillBirthday: "42 days"),
        UserModel(name: "Tom Johnson", age: "18", image: "boy", dayTillBirthday: "05.06", tillBirthday: "87 days"),
    ] {
        didSet {
            addingCharacters()
        }
    }

    var delegate: InformationDelegate?

    private let birthdayReminderLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 78, y: 60, width: 209, height: 20)
        label.text = "Birthday Reminder"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()

    // Изображения
    private let cakeImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 314, y: 119, width: 44, height: 44)
        image.image = UIImage(named: "cakeOne")
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        view.backgroundColor = .white
        view.addSubview(cakeImageView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(addButtun)
        )

        addingCharacters()
    }

    func addingCharacters() {
        var startY = 94
        for item in people {
            userCreate(person: item, sizeY: startY)
            startY += 95
        }
    }

    func userCreate(person: UserModel, sizeY: Int) {
        let userView = UserView()
        userView.thirdNameLabel.text = person.name
        userView.avatarImageView.image = UIImage(named: person.image)
        userView.dayTillBirthday.text = "\(person.dayTillBirthday) - turns \(person.age)"
        userView.tillBirthday.text = person.tillBirthday
        userView.frame = CGRect(x: 20, y: sizeY, width: 335, height: 94)
        view.addSubview(userView)
    }

    @objc func addButtun() {
        let modalViewController = InformationAboutPersonViewController()
        modalViewController.delegate = self
        present(modalViewController, animated: true, completion: nil)
    }
}

extension BirthdayReminderViewController: InformationDelegate {
    func informationTransfer(_ user: UserModel) {
        people.append(user)
    }
}
