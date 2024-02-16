// Product.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// модель
struct Product {
    var price: String
    var productImage: String
    var basketImage: String
    var name: String

    init(price: String, productImage: String, basketImage: String) {
        self.price = price
        self.productImage = productImage
        self.basketImage = basketImage
        name = ""
    }
}
