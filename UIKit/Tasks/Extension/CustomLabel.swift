// CustomLabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для кастомного лейбла для избежания копи паста
class CustomLabel: UILabel {
    convenience init(name: String, frame: CGRect) {
        self.init(frame: frame)
        text = name
        textColor = .black
        numberOfLines = 0
        textAlignment = .center
        font = UIFont(name: "Verdana", size: 14)
    }
}
