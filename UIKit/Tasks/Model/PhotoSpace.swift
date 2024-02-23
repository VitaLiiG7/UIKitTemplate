// PhotoSpace.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///  Для заполнения фотографий в коллекции
struct PhotoSpace {
    /// Название изображения
    var imageName: String
    /// айди фото
    var id: Int

    static func makePhotoSpace() -> [PhotoSpace] {
        [
            .init(imageName: "earth", id: 1),
            .init(imageName: "photoEarth", id: 2),
            .init(imageName: "rocketInSpace", id: 3),
            .init(imageName: "rocketLaunch", id: 4),
            .init(imageName: "photoEarth", id: 5),
            .init(imageName: "rocketInSpace", id: 6),
            .init(imageName: "rocketLaunch", id: 7),
            .init(imageName: "earth", id: 8),
            .init(imageName: "rocketLaunch", id: 9),
            .init(imageName: "photoEarth", id: 10),
            .init(imageName: "earth", id: 11),
            .init(imageName: "photoEarth", id: 12),
        ]
    }

//    static func rundomPhotos(with count: Int) -> [PhotoSpace] {
//        (0 ..< count).map { _ in makePhotoSpace().randomElement() ?? PhotoSpace(imageName: "guy", id: 42) }
//    }
}
