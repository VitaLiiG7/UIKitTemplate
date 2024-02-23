// StoriesSpace.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Для заполнения историй
struct StoriesSpace {
    /// Название изображения
    var nameImageSpace: String
    /// Имя пользователя
    var nameLabelSpace: String

    static func makeProfile() -> [StoriesSpace] {
        [
            .init(nameImageSpace: "rocket", nameLabelSpace: "Запуск"),
            .init(nameImageSpace: "moon", nameLabelSpace: "Луна"),
            .init(nameImageSpace: "astronaut", nameLabelSpace: "Космонавт"),
            .init(nameImageSpace: "space", nameLabelSpace: "Космос"),
            .init(nameImageSpace: "rocket", nameLabelSpace: "Запуск"),
            .init(nameImageSpace: "moon", nameLabelSpace: "Луна"),
            .init(nameImageSpace: "space", nameLabelSpace: "Космос"),
            .init(nameImageSpace: "rocket", nameLabelSpace: "Запуск"),
        ]
    }
}
