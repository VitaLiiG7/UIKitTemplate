// NumberPickerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс
class NumberPickerViewController: UIViewController {
    let picker = UIPickerView()
    let array: [Int] = Array(1 ... 10)
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        picker.center = view.center
        picker.dataSource = self
        picker.delegate = self
        view.addSubview(picker)
    }
}

extension NumberPickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        array.count
    }
}

extension NumberPickerViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let arry1 = array[row]
        return String(arry1)
    }
}
