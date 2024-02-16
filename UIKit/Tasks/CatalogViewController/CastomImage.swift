// CastomImage.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class CastomImage: UIImageView {
    convenience init(image: UIImage) {
        self.init()
        self.image = image
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 12
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4
        layer.masksToBounds = true
    }
}

//    final class CoffeeModifierLabel: UILabel {
//        convenience init(name: String) {
//            self.init(name: name)
//            text = name
//            textColor = .black
//            numberOfLines = 0
//            textAlignment = .center
//            font = UIFont(name: "Verdana", size: 14)
//        }
//    }
