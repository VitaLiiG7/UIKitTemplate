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

    private let birthdayReminderLabel: UILabel = {
        let birthdayReminderLabel = UILabel()
        birthdayReminderLabel.frame = CGRect(x: 78, y: 60, width: 209, height: 20)
        birthdayReminderLabel.text = "Birthday Reminder"
        birthdayReminderLabel.textAlignment = .center
        birthdayReminderLabel.font = UIFont.boldSystemFont(ofSize: 18)
        birthdayReminderLabel.textColor = .black
        return birthdayReminderLabel
    }()

    private let firstNameLabel: UILabel = {
        let firstNameLabel = UILabel()
        firstNameLabel.frame = CGRect(x: 102, y: 119, width: 209, height: 20)
        firstNameLabel.text = "Helena Link"
        firstNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        firstNameLabel.textColor = .black
        return firstNameLabel
    }()

    private let firstDateBirthLabel: UILabel = {
        let firstDateBirthLabel = UILabel()
        firstDateBirthLabel.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        firstDateBirthLabel.text = "10.03 - turns 25!"
        firstDateBirthLabel.font = UIFont.systemFont(ofSize: 14)
        firstDateBirthLabel.textColor = UIColor(red: 17 / 255.0, green: 17 / 255.0, blue: 17 / 255.0, alpha: 1)
        return firstDateBirthLabel
    }()

    private let secondNameLabel: UILabel = {
        let secondNameLabel = UILabel()
        secondNameLabel.frame = CGRect(x: 102, y: 214, width: 209, height: 20)
        secondNameLabel.text = "Verona Tusk"
        secondNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        secondNameLabel.textColor = .black
        return secondNameLabel
    }()

    private let secondDateBirthLabel: UILabel = {
        let secondDateBirthLabel = UILabel()
        secondDateBirthLabel.frame = CGRect(x: 102, y: 147, width: 209, height: 20)
        secondDateBirthLabel.text = "10.03 - turns 25!"
        secondDateBirthLabel.font = UIFont.systemFont(ofSize: 14)
        secondDateBirthLabel.textColor = UIColor(red: 17 / 255.0, green: 17 / 255.0, blue: 17 / 255.0, alpha: 1)
        return secondDateBirthLabel
    }()

    private let thirdNameLabel: UILabel = {
        let thirdNameLabel = UILabel()
        thirdNameLabel.frame = CGRect(x: 102, y: 309, width: 209, height: 20)
        thirdNameLabel.text = "Alex Smith"
        thirdNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        thirdNameLabel.textColor = .black
        return thirdNameLabel
    }()

    private let thirdDateBirthLabel: UILabel = {
        let secondDateBirthLabel = UILabel()
        secondDateBirthLabel.frame = CGRect(x: 102, y: 337, width: 209, height: 20)
        secondDateBirthLabel.text = "21.04 - turns 51"
        secondDateBirthLabel.font = UIFont.systemFont(ofSize: 14)
        secondDateBirthLabel.textColor = UIColor(red: 17 / 255.0, green: 17 / 255.0, blue: 17 / 255.0, alpha: 1)
        return secondDateBirthLabel
    }()

    private let fourthNameLabel: UILabel = {
        let fourthNameLabel = UILabel()
        fourthNameLabel.frame = CGRect(x: 102, y: 404, width: 209, height: 20)
        fourthNameLabel.text = "Tom Johnson"
        fourthNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        fourthNameLabel.textColor = .black
        return fourthNameLabel
    }()

//    var buttonItem: UIBarButtonItem = {
//        let buttonItem = UIBarButtonItem()
//        buttonItem.image = UIImage(systemName: "plus")
//        buttonItem.action = #selector(addButtun)
//        return buttonItem
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        [
            birthdayReminderLabel,
            firstDateBirthLabel,
            firstNameLabel,
            secondNameLabel,
            secondDateBirthLabel,
            thirdNameLabel,
            fourthNameLabel
        ].forEach { view.addSubview($0) }
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .done,
            target: self,
            action: #selector(addButtun)
        )
    }

    @objc func addButtun() {
        let modalViewController = InformationAboutPersonViewController()
        present(modalViewController, animated: true, completion: nil)
    }
}
