// DatePickerViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
/// Класс
class DatePickerViewController: UIViewController {
    private let dataPicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        dataPicker.center = view.center
        dataPicker.addTarget(self, action: #selector(datePickerChenge(parametr:)), for: .valueChanged)
        view.addSubview(dataPicker)
    }

    @objc func datePickerChenge(parametr: UIDatePicker) {
        if parametr.isEqual(dataPicker) {
            print("JOpa =", parametr.date)
        }
    }
}
