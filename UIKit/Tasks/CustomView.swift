// CustomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вью для округления квадратов
final class CustomView: UIView {
    // MARK: - Life Cycle

    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 2
    }
}
