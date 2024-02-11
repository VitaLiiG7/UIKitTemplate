// InformationAboutPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol InformationDelegate: AnyObject {
    func informationTransfer(_ user: UserModel)
}

/// Класс информация о человеке
class InformationAboutPersonViewController: UIViewController {
    var number = NumberPicker()
    var gender = People()
    var delegate: InformationDelegate?

    private let datePicker = UIDatePicker()

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
        changePhotoLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        changePhotoLabel.textColor = UIColor(red: 0 / 255.0, green: 122 / 255.0, blue: 255 / 255.0, alpha: 1)
        return changePhotoLabel
    }()

    private let nameSurnameLabel: CustomLabel = {
        let nameSurnameLabel = CustomLabel()
        nameSurnameLabel.frame = CGRect(x: 20, y: 239, width: 175, height: 31)
        nameSurnameLabel.text = "Name Surname"
        return nameSurnameLabel
    }()

    var typingNameSurnameField: UITextField = {
        let typingNameSurnameField = UITextField()
        typingNameSurnameField.placeholder = "Typing Name Surname"
        typingNameSurnameField.font = UIFont.systemFont(ofSize: 14)
        typingNameSurnameField.frame = CGRect(x: 20, y: 268, width: 250, height: 17)
        return typingNameSurnameField
    }()

    private let birthdayLabel: CustomLabel = {
        let birthdayLabel = CustomLabel()
        birthdayLabel.frame = CGRect(x: 20, y: 314, width: 175, height: 19)
        birthdayLabel.text = "Birthday"
        return birthdayLabel
    }()

    private let typingDateBirthField: UITextField = {
        let typingDateBirthField = UITextField()
        typingDateBirthField.placeholder = "Typing Date of Birth"
        typingDateBirthField.font = UIFont.systemFont(ofSize: 14)
        typingDateBirthField.frame = CGRect(x: 20, y: 343, width: 250, height: 17)

        return typingDateBirthField
    }()

    private let ageLabel: CustomLabel = {
        let ageLabel = CustomLabel()
        ageLabel.frame = CGRect(x: 20, y: 389, width: 175, height: 19)
        ageLabel.text = "Age"
        return ageLabel
    }()

    var typingAgeField: UITextField = {
        let typingAgeField = UITextField()
        typingAgeField.placeholder = "Typing age"
        typingAgeField.font = UIFont.systemFont(ofSize: 14)
        typingAgeField.frame = CGRect(x: 20, y: 418, width: 250, height: 17)
        return typingAgeField
    }()

    private let genderLabel: CustomLabel = {
        let genderLabel = CustomLabel()
        genderLabel.frame = CGRect(x: 20, y: 462, width: 175, height: 19)
        genderLabel.text = "Gender"
        return genderLabel
    }()

    private let indicateGenderField: UITextField = {
        let indicateGenderField = UITextField()
        indicateGenderField.placeholder = "Indicate Gender"
        indicateGenderField.font = UIFont.systemFont(ofSize: 14)
        indicateGenderField.frame = CGRect(x: 20, y: 491, width: 250, height: 17)
        return indicateGenderField
    }()

    private let telegramLabel: CustomLabel = {
        let telegramLabel = CustomLabel()
        telegramLabel.frame = CGRect(x: 20, y: 537, width: 175, height: 19)
        telegramLabel.text = "Telegram"
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
        cancelButton.addTarget(self, action: #selector(informationSend), for: .touchUpInside)
        return cancelButton
    }()

    var convertedDate: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupPicker()
    }

    func setupView() {
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
    }

    func setupPicker() {
        // DataPicker
        typingDateBirthField.inputView = datePicker
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels

        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
        typingDateBirthField.inputAccessoryView = toolBar

        // Picker Age
        let toolBarTwo = UIToolbar()
        toolBarTwo.sizeToFit()
        let button = UIBarButtonItem(title: "ОК", style: .done, target: self, action: #selector(secondDoneAction))
        typingAgeField.inputView = number

        toolBarTwo.setItems([flexSpace, button], animated: true)
        typingAgeField.inputAccessoryView = toolBarTwo

        // Picker Gender
        indicateGenderField.inputView = gender
        let toolBarThree = UIToolbar()
        toolBarThree.sizeToFit()
        let buttonThrid = UIBarButtonItem(
            title: "ОК",
            style: .done,
            target: self,
            action: #selector(thirdDoneAction)
        )
        toolBarThree.setItems([flexSpace, buttonThrid], animated: true)
        indicateGenderField.inputAccessoryView = gender
        indicateGenderField.inputAccessoryView = toolBarThree
    }

    @objc func selectTelegram() {
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

    @objc func informationSend() {
        let person = UserModel(
            name: typingNameSurnameField.text ?? "",
            age: typingAgeField.text ?? "",
            image: "photo",
            dayTillBirthday: convertedDate, tillBirthday: "\(Int.random(in: 1 ... 360)) \ndays"
        )
        delegate?.informationTransfer(person)

        dismiss(animated: true, completion: nil)
    }

    @objc func thirdDoneAction() {
        indicateGenderField.text = gender.result
        indicateGenderField.resignFirstResponder()
    }

    @objc func secondDoneAction() {
        typingAgeField.resignFirstResponder()
        typingAgeField.text = number.info
    }

    @objc func doneAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let convertedDateFormatter = DateFormatter()
        convertedDateFormatter.dateFormat = "dd.MM"
        convertedDate = convertedDateFormatter.string(from: datePicker.date)
        typingDateBirthField.text = dateFormatter.string(from: datePicker.date)
        typingDateBirthField.resignFirstResponder()
    }

    @objc func cancel() {
        dismiss(animated: true, completion: nil)
    }
}
