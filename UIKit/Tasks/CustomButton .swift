// CustomButton .swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для создание кастомной кнопки
class CustomButton: UIButton {
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        styleButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        styleButton()
    }

    // MARK: - Public Properties

    func styleButton() {
        titleLabel?.textAlignment = .center
        layer.cornerRadius = 30
        layer.borderWidth = 3
    }
}
