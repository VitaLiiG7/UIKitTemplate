// InformationAboutPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс информация о человеке
class InformationAboutPersonViewController: UIViewController {
    private let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.frame = CGRect(x: 125, y: 66, width: 125, height: 125)
        photoImageView.image = UIImage(named: "photo")
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.layer.cornerRadius = 12
        return photoImageView
    }()

    private let changePhotoLabel: UILabel = {
        let changePhotoLabel = UILabel()
        changePhotoLabel.frame = CGRect(x: 125, y: 199, width: 175, height: 31)
        changePhotoLabel.text = "Change photo"
        changePhotoLabel.font = UIFont.boldSystemFont(ofSize: 16)
        changePhotoLabel.textColor = UIColor(red: 0 / 255.0, green: 122 / 255.0, blue: 255 / 255.0, alpha: 1)
        return changePhotoLabel
    }()

    private let nameSurnameLabel: UILabel = {
        let nameSurnameLabel = UILabel()
        nameSurnameLabel.frame = CGRect(x: 20, y: 239, width: 175, height: 31)
        nameSurnameLabel.text = "Name Surname"
        nameSurnameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        nameSurnameLabel.textColor = .black
        return nameSurnameLabel
    }()

    private let typingNameSurnameField: UITextField = {
        let typingNameSurnameField = UITextField()
        typingNameSurnameField.placeholder = "Typing Name Surname"
        typingNameSurnameField.font = UIFont.systemFont(ofSize: 14)
        typingNameSurnameField.frame = CGRect(x: 20, y: 268, width: 250, height: 17)
        return typingNameSurnameField
    }()

    private let birthdayLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.frame = CGRect(x: 20, y: 314, width: 175, height: 19)
        birthdayLabel.text = "Birthday"
        birthdayLabel.font = UIFont.boldSystemFont(ofSize: 16)
        birthdayLabel.textColor = .black
        return birthdayLabel
    }()

    private let typingDateBirthField: UITextField = {
        let typingDateBirthField = UITextField()
        typingDateBirthField.placeholder = "Typing Date of Birth"
        typingDateBirthField.font = UIFont.systemFont(ofSize: 14)
        typingDateBirthField.frame = CGRect(x: 20, y: 343, width: 250, height: 17)
        return typingDateBirthField
    }()

    private let ageLabel: UILabel = {
        let ageLabel = UILabel()
        ageLabel.frame = CGRect(x: 20, y: 389, width: 175, height: 19)
        ageLabel.text = "Age"
        ageLabel.font = UIFont.boldSystemFont(ofSize: 16)
        ageLabel.textColor = .black
        return ageLabel
    }()

    private lazy var typingAgeField: UITextField = {
        let typingAgeField = UITextField()
        typingAgeField.placeholder = "Typing age"
        typingAgeField.font = UIFont.systemFont(ofSize: 14)
        typingAgeField.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        typingAgeField.addTarget(self, action: #selector(chooseAge), for: .allEvents)
        return typingAgeField
    }()

    private let genderLabel: UILabel = {
        let genderLabel = UILabel()
        genderLabel.frame = CGRect(x: 20, y: 462, width: 175, height: 19)
        genderLabel.text = "Gender"
        genderLabel.font = UIFont.boldSystemFont(ofSize: 16)
        genderLabel.textColor = .black
        return genderLabel
    }()

    private let indicateGenderField: UITextField = {
        let indicateGenderField = UITextField()
        indicateGenderField.placeholder = "Indicate Gender"
        indicateGenderField.font = UIFont.systemFont(ofSize: 14)
        indicateGenderField.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        return indicateGenderField
    }()

    private let telegramLabel: UILabel = {
        let telegramLabel = UILabel()
        telegramLabel.frame = CGRect(x: 20, y: 537, width: 175, height: 19)
        telegramLabel.text = "Telegram"
        telegramLabel.font = UIFont.boldSystemFont(ofSize: 16)
        telegramLabel.textColor = .black
        return telegramLabel
    }()

    private lazy var typingTelegramField: UITextField = {
        let typingTelegramField = UITextField()
        typingTelegramField.placeholder = "Typing Telegram"
        typingTelegramField.font = UIFont.systemFont(ofSize: 14)
        typingTelegramField.frame = CGRect(x: 20, y: 566, width: 250, height: 17)
        typingTelegramField.addTarget(self, action: #selector(selectTelegram), for: .allEvents)
        return typingTelegramField
    }()

    private let lineOneView: UIView = {
        let lineOneView = UIView()
        lineOneView.frame = CGRect(x: 20, y: 293, width: 350, height: 1)
        lineOneView.backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
        return lineOneView
    }()

    private let lineTwoView: UIView = {
        let lineTwoView = UIView()
        lineTwoView.frame = CGRect(x: 20, y: 366, width: 350, height: 1)
        lineTwoView.backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
        return lineTwoView
    }()

    private let lineThreeView: UIView = {
        let lineThreeView = UIView()
        lineThreeView.frame = CGRect(x: 20, y: 443, width: 350, height: 1)
        lineThreeView.backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
        return lineThreeView
    }()

    private let lineFourView: UIView = {
        let lineFourView = UIView()
        lineFourView.frame = CGRect(x: 20, y: 516, width: 350, height: 1)
        lineFourView.backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
        return lineFourView
    }()

    private let lineFiveView: UIView = {
        let lineFiveView = UIView()
        lineFiveView.frame = CGRect(x: 20, y: 591, width: 350, height: 1)
        lineFiveView.backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
        return lineFiveView
    }()

    private lazy var cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 16)
        cancelButton.frame = CGRect(x: 20, y: 15, width: 60, height: 20)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return cancelButton
    }()

    private lazy var addButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("Add", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 16)
        cancelButton.frame = CGRect(x: 325, y: 15, width: 30, height: 20)
//        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
        return cancelButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        view.backgroundColor = .white
        for item in [
            nameSurnameLabel,
            typingNameSurnameField,
            birthdayLabel,
            typingDateBirthField,
            ageLabel,
            typingAgeField,
            genderLabel,
            indicateGenderField,
            telegramLabel,
            typingTelegramField,
            lineOneView,
            lineTwoView,
            lineThreeView,
            lineFourView,
            lineFiveView,
            changePhotoLabel,
            photoImageView,
            cancelButton,
            addButton
        ] {
            view.addSubview(item)
        }
    }

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }

    @objc func selectTelegram() {
        let alert = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        let actionOk = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(cancel)
        alert.addAction(actionOk)
        alert.preferredAction = actionOk
        present(alert, animated: true)
    }

    @objc func chooseAge() {
        let modalViewController = NumberPickerViewController()
        present(modalViewController, animated: true, completion: nil)
    }
}
