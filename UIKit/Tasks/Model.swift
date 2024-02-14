// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Класс модель
struct Model {
    /// Класс модель для передачи данных между контроллерами
    var coffeeMap: [String: String]
    var sum: Int
    var confirmation: String

    init(coffeeMap: [String: String]) {
        self.coffeeMap = coffeeMap
        sum = 0
        confirmation = ""
    }

    init(sum: Int, confirmation: String) {
        self.sum = sum
        self.confirmation = confirmation
        coffeeMap = ["": ""]
    }
}
