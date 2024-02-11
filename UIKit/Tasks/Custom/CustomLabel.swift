// CustomLabel.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс кастомного лейбла
class CustomLabel: UILabel {
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        styleLabel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        styleLabel()
    }

    // MARK: - Public Methods

    private func styleLabel() {
        textColor = UIColor(red: 17 / 255.0, green: 17 / 255.0, blue: 17 / 255.0, alpha: 1)
        font = UIFont(name: "Verdana-Bold", size: 16)
    }
}
