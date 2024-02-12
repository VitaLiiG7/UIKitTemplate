// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Класс для повторяющего цвета у view
class CustomView: UIView {
    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        styleView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        styleView()
    }

    // MARK: - Private Methods

    private func styleView() {
        backgroundColor = UIColor(red: 208 / 255.0, green: 214 / 255.0, blue: 220 / 255.0, alpha: 1)
    }
}
