// StoriesSpace.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// Для заполнения историй
struct StoriesSpace {
    /// Название изображения
    var spaceImageName: String
    /// Имя пользователя
    var spaceUserName: String

    static func makeProfile() -> [StoriesSpace] {
        [
            .init(spaceImageName: "rocket", spaceUserName: "Запуск"),
            .init(spaceImageName: "moon", spaceUserName: "Луна"),
            .init(spaceImageName: "astronaut", spaceUserName: "Космонавт"),
            .init(spaceImageName: "space", spaceUserName: "Космос"),
            .init(spaceImageName: "rocket", spaceUserName: "Запуск"),
            .init(spaceImageName: "moon", spaceUserName: "Луна"),
            .init(spaceImageName: "space", spaceUserName: "Космос"),
            .init(spaceImageName: "rocket", spaceUserName: "Запуск"),
        ]
    }
}
