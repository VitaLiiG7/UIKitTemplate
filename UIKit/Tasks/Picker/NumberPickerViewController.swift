// NumberPickerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс где создан пикер для выбора возраста
final class NumberPicker: UIPickerView {
    var ageInformation: String = ""

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    // MARK: - Private Methods

    private func setup() {
        dataSource = self
        delegate = self
    }
}

// расширение определяет количество элементов и строк в пикере и сохраняет выбранное значение
extension NumberPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        100
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ageInformation = "\(row)"
    }
}

// расширение определяет, какой текст будет отображаться в каждой строке
extension NumberPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(row)"
    }
}
