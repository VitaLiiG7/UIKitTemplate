// CustomRoundShadowImageView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Кастомнное изображениес настройкой округления и тени
final class CustomRoundShadowImageView: UIImageView {
    // MARK: - Initializers

    convenience init(image: UIImage) {
        self.init()
        self.image = image
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 4)
        layer.shadowOpacity = 1
        layer.shadowRadius = 4
        layer.masksToBounds = false
    }
}
