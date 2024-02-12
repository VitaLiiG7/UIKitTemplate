// InformationAboutPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol InformationDelegate: AnyObject {
    func transferInformation(_ user: UserModel)
}

/// Класс в котором заполняется и передается информация о человеке
final class InformationAboutPersonViewController: UIViewController {
    private var number = NumberPicker()
    private var gender = GenderPicker()
    var delegate: InformationDelegate?

    // MARK: - Visual Components

    // создание изображения
    private let photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.frame = CGRect(x: 125, y: 66, width: 125, height: 125)
        photoImageView.image = UIImage(named: "photo")
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.layer.cornerRadius = 12
        return photoImageView
    }()

    // создание лейблов
    private let changePhotoLabel: UILabel = {
        let changePhotoLabel = UILabel()
        changePhotoLabel.frame = CGRect(x: 125, y: 199, width: 175, height: 31)
        changePhotoLabel.text = "Change photo"
        changePhotoLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        changePhotoLabel.textColor = UIColor(red: 0 / 255.0, green: 122 / 255.0, blue: 255 / 255.0, alpha: 1)
        return changePhotoLabel
    }()

    private let nameSurnameLabel: BaseLabel = {
        let nameSurnameLabel = BaseLabel()
        nameSurnameLabel.frame = CGRect(x: 20, y: 239, width: 175, height: 31)
        nameSurnameLabel.text = "Name Surname"
        return nameSurnameLabel
    }()

    private let birthdayLabel: BaseLabel = {
        let birthdayLabel = BaseLabel()
        birthdayLabel.frame = CGRect(x: 20, y: 314, width: 175, height: 19)
        birthdayLabel.text = "Birthday"
        return birthdayLabel
    }()

    private let ageLabel: BaseLabel = {
        let ageLabel = BaseLabel()
        ageLabel.frame = CGRect(x: 20, y: 389, width: 175, height: 19)
        ageLabel.text = "Age"
        return ageLabel
    }()

    private let genderLabel: BaseLabel = {
        let genderLabel = BaseLabel()
        genderLabel.frame = CGRect(x: 20, y: 462, width: 175, height: 19)
        genderLabel.text = "Gender"
        return genderLabel
    }()

    private let telegramLabel: BaseLabel = {
        let telegramLabel = BaseLabel()
        telegramLabel.frame = CGRect(x: 20, y: 537, width: 175, height: 19)
        telegramLabel.text = "Telegram"
        return telegramLabel
    }()

    // создание текстфилдов
    var typingNameSurnameField: UITextField = {
        let typingNameSurnameField = UITextField()
        typingNameSurnameField.placeholder = "Typing Name Surname"
        typingNameSurnameField.font = UIFont(name: "Verdana", size: 14)
        typingNameSurnameField.frame = CGRect(x: 20, y: 268, width: 250, height: 17)
        return typingNameSurnameField
    }()

    private let typingDateBirthField: UITextField = {
        let typingDateBirthField = UITextField()
        typingDateBirthField.placeholder = "Typing Date of Birth"
        typingDateBirthField.font = UIFont.systemFont(ofSize: 14)
        typingDateBirthField.frame = CGRect(x: 20, y: 343, width: 250, height: 17)

        return typingDateBirthField
    }()

    private var typingAgeField: UITextField = {
        let typingAgeField = UITextField()
        typingAgeField.placeholder = "Typing age"
        typingAgeField.font = UIFont.systemFont(ofSize: 14)
        typingAgeField.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        return typingAgeField
    }()

    private let indicateGenderField: UITextField = {
        let indicateGenderField = UITextField()
        indicateGenderField.placeholder = "Indicate Gender"
        indicateGenderField.font = UIFont.systemFont(ofSize: 14)
        indicateGenderField.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        return indicateGenderField
    }()

    private lazy var typingTelegramField: UITextField = {
        let typingTelegramField = UITextField()
        typingTelegramField.placeholder = "Typing Telegram"
        typingTelegramField.font = UIFont.systemFont(ofSize: 14)
        typingTelegramField.frame = CGRect(x: 20, y: 566, width: 250, height: 17)
        typingTelegramField.addTarget(self, action: #selector(selectTelegram), for: .allEvents)
        return typingTelegramField
    }()

    // создание линий
    private let lineOneView: CustomView = {
        let lineOneView = CustomView()
        lineOneView.frame = CGRect(x: 20, y: 293, width: 350, height: 1)
        return lineOneView
    }()

    private let lineTwoView: CustomView = {
        let lineTwoView = CustomView()
        lineTwoView.frame = CGRect(x: 20, y: 366, width: 350, height: 1)
        return lineTwoView
    }()

    private let lineThreeView: CustomView = {
        let lineThreeView = CustomView()
        lineThreeView.frame = CGRect(x: 20, y: 443, width: 350, height: 1)
        return lineThreeView
    }()

    private let lineFourView: CustomView = {
        let lineFourView = CustomView()
        lineFourView.frame = CGRect(x: 20, y: 516, width: 350, height: 1)
        return lineFourView
    }()

    private let lineFiveView: CustomView = {
        let lineFiveView = CustomView()
        lineFiveView.frame = CGRect(x: 20, y: 591, width: 350, height: 1)
        return lineFiveView
    }()

    // создание кнопок
    private let cancelButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 16)
        cancelButton.frame = CGRect(x: 20, y: 15, width: 60, height: 20)
        return cancelButton
    }()

    private let addButton: UIButton = {
        let cancelButton = UIButton()
        cancelButton.setTitle("Add", for: .normal)
        cancelButton.setTitleColor(.systemBlue, for: .normal)
        cancelButton.titleLabel?.font = .systemFont(ofSize: 16)
        cancelButton.frame = CGRect(x: 325, y: 15, width: 30, height: 20)
        return cancelButton
    }()

    // MARK: - Private Properties

    private let datePicker = UIDatePicker()
    private var convertedDate: String = ""

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPicker()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .white
        for item in [
            nameSurnameLabel, typingNameSurnameField, birthdayLabel,
            typingDateBirthField, ageLabel, typingAgeField,
            genderLabel, indicateGenderField, telegramLabel,
            typingTelegramField, lineOneView, lineTwoView,
            lineThreeView, lineFourView, lineFiveView,
            changePhotoLabel, photoImageView, cancelButton,
            addButton
        ] {
            view.addSubview(item)
        }

        addButton.addTarget(self, action: #selector(sendInformation), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancel), for: .touchUpInside)
    }

    private func setupPicker() {
        // установка DataPicker
        typingDateBirthField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.backgroundColor = .white
        let toolBarDateBirth = UIToolbar()
        toolBarDateBirth.sizeToFit()
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(creatureDateFormatter)
        )
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBarDateBirth.setItems([flexSpace, doneButton], animated: true)
        typingDateBirthField.inputAccessoryView = toolBarDateBirth

        // установк Picker Age
        let toolBarAge = UIToolbar()
        toolBarAge.sizeToFit()
        let button = UIBarButtonItem(title: "ОК", style: .done, target: self, action: #selector(chooseAge))
        number.backgroundColor = .white
        typingAgeField.inputView = number

        toolBarAge.setItems([flexSpace, button], animated: true)
        typingAgeField.inputAccessoryView = toolBarAge

        // установк Picker Gender
        indicateGenderField.inputView = gender
        let toolBarGender = UIToolbar()
        toolBarGender.sizeToFit()
        let buttonThrid = UIBarButtonItem(
            title: "ОК",
            style: .done,
            target: self,
            action: #selector(chooseGender)
        )
        toolBarGender.setItems([flexSpace, buttonThrid], animated: true)
        gender.backgroundColor = .white
        indicateGenderField.inputAccessoryView = gender
        indicateGenderField.inputAccessoryView = toolBarGender
    }

    @objc private func selectTelegram() {
        let alert = UIAlertController(title: "Please enter Telegram", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .default)
        let actionOk = UIAlertAction(title: "Ok", style: .default) { _ in
            if let text = alert.textFields?.first {
                self.typingTelegramField.text = "\(text.text ?? "")"
            }
        }

        alert.addTextField { textField in
            textField.placeholder = "Typing Telegram"
        }

        alert.addAction(cancel)
        alert.addAction(actionOk)
        alert.preferredAction = actionOk
        present(alert, animated: true)
    }

    @objc private func sendInformation() {
        let person = UserModel(
            name: typingNameSurnameField.text ?? "",
            age: typingAgeField.text ?? "",
            image: "photo",
            dayBirthday: convertedDate, tillBirthday: "\(Int.random(in: 1 ... 360)) \ndays"
        )
        delegate?.transferInformation(person)
        dismiss(animated: true, completion: nil)
    }

    @objc private func chooseGender() {
        indicateGenderField.text = gender.result
        indicateGenderField.resignFirstResponder()
    }

    @objc private func chooseAge() {
        typingAgeField.resignFirstResponder()
        typingAgeField.text = number.ageInformation
    }

    @objc private func creatureDateFormatter() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let convertedDateFormatter = DateFormatter()
        convertedDateFormatter.dateFormat = "dd.MM"
        convertedDate = convertedDateFormatter.string(from: datePicker.date)
        typingDateBirthField.text = dateFormatter.string(from: datePicker.date)
        typingDateBirthField.resignFirstResponder()
    }

    @objc private func cancel() {
        dismiss(animated: true, completion: nil)
    }
}
