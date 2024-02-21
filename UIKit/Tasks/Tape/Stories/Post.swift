// Post.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

/// для заполнения историй
struct Stories {
    var nameImage: String
    var nameLabel: String
}

/// структура
struct Post {
    var avatarImage: String
    var avatarName: String
    var postImage: [String] // тут должен быть массив строк
    var likesCount: String
    var lastComment: String

    let userImages = ["theGuyHorses", "castle", "womanOld"]
}

// Структура рекомендации
struct Recommend {
    var avatarImage: String
    var avatarName: String
}

/// структура уведомления
struct Notifications {
    var nameImage: String
    var nameLabel: String
    var photoImage: String
}

// struct NotificationsButton {
//    var nameImage: String
//    var nameLabel: String
//    var photo: String
// }
