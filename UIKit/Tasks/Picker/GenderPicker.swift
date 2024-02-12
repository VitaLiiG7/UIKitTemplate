// GenderPicker.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс где создан пикер для выбора пола
final class GenderPicker: UIPickerView {
    private var genders: [String] = ["Male", "Female"]
    var result = ""

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        dataSource = self
        delegate = self
    }
}

// расширениe пикера для выбора пола
extension GenderPicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        genders.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        result = genders[row]
    }
}

// расширение определяет, какой текст будет отображаться в каждой строке и сохраняет выбранное значение
extension GenderPicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        genders[row]
    }
}
