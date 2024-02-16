// InformationAboutShoes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для передачи данных
struct InformationAboutShoes {
    let size: [Int]
    let price: String
    let shoeImage: String
    let shoeName: String

    init(price: String, shoeImage: String, shoeName: String) {
        size = [0]
        self.price = price
        self.shoeImage = shoeImage
        self.shoeName = shoeName
    }
}
