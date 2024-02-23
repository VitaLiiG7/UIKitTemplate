// PhotoSpace.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

///  Для заполнения фотографий в коллекции
struct PhotoSpace {
    /// Название изображения
    var imageName: String

    static func makePhotoSpace() -> [PhotoSpace] {
        [
            .init(imageName: "earth"),
            .init(imageName: "photoEarth"),
            .init(imageName: "rocketInSpace"),
            .init(imageName: "rocketLaunch"),
            .init(imageName: "photoEarth"),
            .init(imageName: "rocketInSpace"),
            .init(imageName: "rocketLaunch"),
            .init(imageName: "earth"),
            .init(imageName: "rocketLaunch"),
            .init(imageName: "photoEarth"),
            .init(imageName: "earth"),
            .init(imageName: "photoEarth"),
        ]
    }
}
