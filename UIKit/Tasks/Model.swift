// Model.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// структура Модель переворачивает слово
struct Model {
    func flipWord(_ word: String) -> String {
        String(word.reversed())
    }
}
