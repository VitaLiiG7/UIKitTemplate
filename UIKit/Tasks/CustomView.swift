// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью для округления квадратов
final class CustomView: UIView {
    // MARK: - Constants

    enum Constants {
        static let number = 2.0
    }

    // MARK: - Life Cycle

    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / Constants.number
    }
}
