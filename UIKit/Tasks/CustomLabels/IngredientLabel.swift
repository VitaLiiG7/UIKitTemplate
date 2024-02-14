// IngredientLabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс кастомный лейбл ингридиент
final class IngredientLabel: UILabel {
    convenience init(name: String, frame: CGRect) {
        self.init(frame: frame)
        text = name
        font = UIFont(name: "Verdana", size: 18)
        textColor = .black
        textAlignment = .left
    }
}
