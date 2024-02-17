// InformationAboutPersonViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для заполнения персональной информации о пользователе ( делает коллега )
class InformationAboutPersonViewController: UIViewController {
    let datePicker = UIDatePicker()
    let toolBar = UIToolbar()
    
 

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
        textField.placeholder = "Почта"
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let birthDayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Дата рождения"
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let footSizeTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Размер ноги"
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Номер телефона"
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let sureNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Фамилия"
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Имя"
        textField.backgroundColor = #colorLiteral(red: 0.9725490212, green: 0.9725490212, blue: 0.9725490212, alpha: 1)
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(hideButton), for: .editingChanged)
        return textField
    }()

    // MARK: - Private Methods

    @objc private func hideButton() {
        if nameTextField.text?.isEmpty ?? false {
            saveButton.isEnabled = true
            saveButton.isHidden = false
        } else {
            saveButton.isEnabled = true
            saveButton.isHidden = false
        }
    }

    private func setupSaveButton() {
        saveButton.widthAnchor.constraint(equalToConstant: 335).isActive = true
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        saveButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        saveButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 650).isActive = true
    }

    private func setupEmailTextField() {
        emailTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        emailTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        emailTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
    }

    private func setupBirthDayTextField() {
        birthDayTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        birthDayTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        birthDayTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        birthDayTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        birthDayTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }

    private func setupFootSizeTextField() {
        footSizeTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        footSizeTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        footSizeTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        footSizeTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
    }

    private func setupPhoneNumberTextField() {
        phoneNumberTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        phoneNumberTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        phoneNumberTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        phoneNumberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
    }

    private func setupSureNameTextField() {
        sureNameTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        sureNameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        sureNameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        sureNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
    }

    private func setupNameTextField() {
        nameTextField.widthAnchor.constraint(equalToConstant: 335).isActive = true
        nameTextField.heightAnchor.constraint(equalToConstant: 44).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
    }
    private func setToolBar() {
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.setItems([flexSpace, doneButton], animated: true)
        birthDayTextField.inputAccessoryView = toolBar
  
    }
    @objc private func doneAction() {
        getDateFromPicker()
        view.endEditing(true)
    }
    private func getDateFromPicker() {
        let formater = DateFormatter()
        formater.dateFormat = "dd.MM.yyyy"
        birthDayTextField.text = formater.string(from: datePicker.date)
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "Мои данные"
        view.addSubview(nameTextField)
        setupNameTextField()
        view.addSubview(sureNameTextField)
        setupSureNameTextField()
        view.addSubview(phoneNumberTextField)
        setupPhoneNumberTextField()
        view.addSubview(footSizeTextField)
        setupFootSizeTextField()
        view.addSubview(birthDayTextField)
        setupBirthDayTextField()
        view.addSubview(emailTextField)
        setupEmailTextField()
        view.addSubview(saveButton)
        setupSaveButton()
        setToolBar()
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}
