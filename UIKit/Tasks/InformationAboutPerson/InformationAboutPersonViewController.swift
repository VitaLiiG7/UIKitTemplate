// InformationAboutPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для заполнения персональной информации о пользователе ( делает коллега )
final class InformationAboutPersonViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let maxNumberCount = 11
        static let datePicker = UIDatePicker()
        static let toolBar = UIToolbar()
        static let myData = "Мои данные"
        static let name = "Имя"
        static let sureName = "Фамилия"
        static let mail = "Почта"
        static let bday = " Дата рождения"
        static let handSize = "Размер ноги"
        static let phoneNumber = "Номер телефона"
        static let phonePatern = "(\\d{1})(\\d{3})(\\d{3})(\\d{2})(\\d+)"
        static let phoneFormat = "$1 ($2) $3-$4-$5"
        static let emailPatern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let emailFormat = "SELF MATCHES %@"
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Visual Components

    private let saveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8334643245, green: 0.0985333994, blue: 0.4855454564, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.layer.cornerRadius = 12
        button.isHidden = true
        return button
    }()

    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.mail
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let birthDayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.bday
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let footSizeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.handSize
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.phoneNumber
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let sureNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.sureName
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = Constants.name
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(hideButton), for: .editingChanged)
        return textField
    }()

    // MARK: - Private Methods

    private func setupPhoneNumberTextFieldConstraints() {
        phoneNumberTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        phoneNumberTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        phoneNumberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    }

    private func setupSaveButtonConstraints() {
        saveButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650).isActive = true
    }

    private func setupEmailTextFieldConstraints() {
        emailTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
    }

    private func setupBirthDayTextFieldConstraints() {
        birthDayTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        birthDayTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        birthDayTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        birthDayTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        birthDayTextField.inputView = Constants.datePicker
        Constants.datePicker.datePickerMode = .date
    }

    private func setupFootSizeTextFieldConstraints() {
        footSizeTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        footSizeTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        footSizeTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        footSizeTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
    }

    private func setupSureNameTextFieldConstraints() {
        sureNameTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        sureNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sureNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        sureNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
    }

    private func setupNameTextFieldConstraints() {
        nameTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }

    private func setToolBar() {
        Constants.datePicker.preferredDatePickerStyle = .inline
        Constants.toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        Constants.toolBar.setItems([flexSpace, doneButton], animated: true)
        birthDayTextField.inputAccessoryView = Constants.toolBar
    }

    private func getDateFromPicker() {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        birthDayTextField.text = formater.string(from: Constants.datePicker.date)
    }

    private func regex() -> NSRegularExpression {
        var regex = NSRegularExpression()
        do {
            regex = try NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)
        } catch {
            print("error")
        }
        return regex
    }

    private func format(phoneNumber: String, shouldRemoveLastDigit: Bool) -> String {
        guard !(shouldRemoveLastDigit && phoneNumber.count <= 2) else { return "+" }
        let range = NSString(string: phoneNumber).range(of: phoneNumber)
        var number = regex().stringByReplacingMatches(in: phoneNumber, options: [], range: range, withTemplate: "")

        if number.count > Constants.maxNumberCount {
            let maxIndex = number.index(number.startIndex, offsetBy: Constants.maxNumberCount)
            number = String(number[number.startIndex ..< maxIndex])
        }

        if shouldRemoveLastDigit {
            let maxIndex = number.index(number.startIndex, offsetBy: number.count - 1)
            number = String(number[number.startIndex ..< maxIndex])
        }

        let maxIndex = number.index(number.startIndex, offsetBy: number.count)
        let regRange = number.startIndex ..< maxIndex

        if number.count < 7 {
            let pattern = "(\\d)(\\d{3})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3",
                options: .regularExpression,
                range: regRange
            )
        } else {
            let pattern = "(\\d)(\\d{3})(\\d{3})(\\d{2})(\\d+)"
            number = number.replacingOccurrences(
                of: pattern,
                with: "$1 ($2) $3-$4-$5",
                options: .regularExpression,
                range: regRange
            )
        }
        return "+" + number
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = Constants.emailPatern
        let emailPred = NSPredicate(format: Constants.emailFormat, emailRegEx)
        return emailPred.evaluate(with: email)
    }

    private func numPad() {
        phoneNumberTextField.delegate = self
        phoneNumberTextField.keyboardType = .numberPad
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = Constants.myData
        setToolBar()
        view.addSubview(nameTextField)
        setupNameTextFieldConstraints()
        view.addSubview(sureNameTextField)
        setupSureNameTextFieldConstraints()
        view.addSubview(phoneNumberTextField)
        setupPhoneNumberTextFieldConstraints()
        view.addSubview(footSizeTextField)
        setupFootSizeTextFieldConstraints()
        view.addSubview(birthDayTextField)
        setupBirthDayTextFieldConstraints()
        view.addSubview(emailTextField)
        setupEmailTextFieldConstraints()
        view.addSubview(saveButton)
        setupSaveButtonConstraints()
        numPad()
    }

    @objc private func hideButton() {
        if nameTextField.text?.isEmpty ?? false {
            saveButton.isEnabled = true
            saveButton.isHidden = false
        } else {
            saveButton.isEnabled = true
            saveButton.isHidden = false
        }
    }

    @objc private func doneAction() {
        getDateFromPicker()
        view.endEditing(true)
    }
}

extension InformationAboutPersonViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let fullString = (textField.text ?? "") + string
        textField.text = format(phoneNumber: fullString, shouldRemoveLastDigit: range.length == 1)
        return false
    }
}
