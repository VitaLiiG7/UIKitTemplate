// CastomView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Кастомный вью
class CastomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func styleView() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 20
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
        layer.masksToBounds = true
    }
}
