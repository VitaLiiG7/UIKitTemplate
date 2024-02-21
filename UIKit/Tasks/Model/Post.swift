/// структура
struct Post {
    /// Название изображения аватара
    var avatarImage: String
    /// Имя пользователя
    var avatarName: String
    /// Список  изображений
    var postImage: [String]
    /// Лайки от пользователей
    var likesCount: String
    /// Комментарий пользователя
    var lastComment: String

    let userImages = ["theGuyHorses", "castle", "womanOld"]
}
