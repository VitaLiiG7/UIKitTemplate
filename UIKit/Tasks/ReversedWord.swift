// ReversedWord.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Модель для разворота слов в обратном направлении
struct ReversedWord {
    /// Задает изначальное слово
    func flipWord(_ word: String) -> String {
        String(word.reversed())
    }
}
