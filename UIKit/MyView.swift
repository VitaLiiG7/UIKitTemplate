//
//  MyView.swift
//  Tasks
//
//  Created by Виталий Горбунов on 24.02.2024.
//

import UIKit

class MyView: UIView {
//    init(color: UIColor) {
//        super.init(frame: .zero)
//        backgroundColor = color
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//    }

    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 2
    }
}
