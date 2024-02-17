// InformationAboutShoes.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для передачи данных между экранами
struct InformationAboutShoes: Hashable {
    // размер обуви
    let size: [Int]
    // цена обуви
    let price: String
    // название изображения
    let shoeImage: String
    // название обуви
    let shoeName: String

    // MARK: - Initializers

    init(price: String, shoeImage: String, shoeName: String) {
        size = [0]
        self.price = price
        self.shoeImage = shoeImage
        self.shoeName = shoeName
    }
}
