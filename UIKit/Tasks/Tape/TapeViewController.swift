// TapeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран лента приложения
final class TapeViewController: UIViewController {
    // MARK: - Types

    private enum CellTypes {
        case stories
        /// Истории
        case firstPost
        /// Первый пост
        case recommendations
        ///  Рекомендации
        case otherPosts
        /// Посты 
    }

    // MARK: - Private Properties

    private let posts: [CellTypes] = [.stories, .firstPost, .recommendations, .otherPosts]

    private let stories = [
        StoriesView(stories: Stories(nameImage: "myAvatar", nameLabel: "Ваша история")),
        StoriesView(stories: Stories(nameImage: "womanInField", nameLabel: "Алла")),
        StoriesView(stories: Stories(nameImage: "womanOld", nameLabel: "Кристина")),
        StoriesView(stories: Stories(nameImage: "vitalik", nameLabel: "Виталий")),
        StoriesView(stories: Stories(nameImage: "theGuyHorses", nameLabel: "Игнат")),
        StoriesView(stories: Stories(nameImage: "guy", nameLabel: "Руслан")),
        StoriesView(stories: Stories(nameImage: "womanOld", nameLabel: "Ирина"))
    ]

    private let post: [Post] = [
        .init(
            avatarImage: "womanInField",
            avatarName: "Галина",
            postImage: ["castle", "vitalik", "theGuyHorses"],
            likesCount: "Нравится: 201",
            lastComment: "tur_v_dagestan красивый замок, cэр!"
        ),
        .init(
            avatarImage: "vitalik",
            avatarName: "Vitalii",
            postImage: ["theGuyHorses", "castle"],
            likesCount: "Нравится: 220",
            lastComment: "tur_v_dagestan Отличная фотка, это где?!"
        ),
        .init(
            avatarImage: "womanOld",
            avatarName: "Любовь",
            postImage: ["womanInField"],
            likesCount: "Нравится: 209",
            lastComment: "tur_v_dagestan Можно с вами познакомиться?"
        ),
        .init(
            avatarImage: "womanInField",
            avatarName: "Галина",
            postImage: ["womanOld", "womanInField"],
            likesCount: "Нравится: 201",
            lastComment: "tur_v_dagestan Наслаждайся собой"
        ),
        .init(
            avatarImage: "vitalik",
            avatarName: "Vitalii",
            postImage: ["theGuyHorses", "castle", "castle"],
            likesCount: "Нравится: 220",
            lastComment: "tur_v_dagestan Подскажите, где купить такую кофту?"
        ),
        .init(
            avatarImage: "womanInField",
            avatarName: "Эльдар",
            postImage: ["guy", "theGuyHorses"],
            likesCount: "Нравится: 201",
            lastComment: "tur_v_dagestan Подскажите, где купить такую футболку?"
        )
    ]

    private let recommends = [
        RecommendView(recommend: Recommend(avatarImage: "vitalik", avatarName: "Alan")),
        RecommendView(recommend: Recommend(avatarImage: "womanInField", avatarName: "Ivanre")),
        RecommendView(recommend: Recommend(avatarImage: "castle", avatarName: "Ruslan")),
        RecommendView(recommend: Recommend(avatarImage: "womanInField", avatarName: "Alina"))
    ]

    private let tableView = {
        let table = UITableView()
        table.register(TapeTableViewCell.self, forCellReuseIdentifier: String(describing: TapeTableViewCell.self))
        table.register(
            ProfilePictureViewCell.self,
            forCellReuseIdentifier: String(describing: ProfilePictureViewCell.self)
        )
        table.register(
            RecommendationsViewCell.self,
            forCellReuseIdentifier: String(describing: RecommendationsViewCell.self)
        )
        table.showsVerticalScrollIndicator = false
        return table
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItems()
        configureUI()
        setupTableViewConstraints()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }

    private func setNavigationItems() {
        let logoBarButtonItemLeft = UIBarButtonItem(image: .rmLink, style: .done, target: nil, action: nil)
        let logoBarButtonItemRich = UIBarButtonItem(image: .message, style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = logoBarButtonItemLeft
        navigationItem.rightBarButtonItem = logoBarButtonItemRich
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    private func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

// MARK: TapeViewController + UITableViewDataSource

extension TapeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let number = posts[section]
        switch number {
        case .stories, .firstPost, .recommendations:
            return 1
        case .otherPosts:
            return post.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = posts[indexPath.section]
        switch cell {
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: TapeTableViewCell.self),
                for: indexPath
            ) as? TapeTableViewCell else { return UITableViewCell() }
            cell.setupScrollView(stories: stories)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: ProfilePictureViewCell.self),
                for: indexPath
            ) as? ProfilePictureViewCell else { return UITableViewCell() }
            cell.configure(user: post[0])
            return cell
        case .recommendations:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: RecommendationsViewCell.self),
                for: indexPath
            ) as? RecommendationsViewCell else { return UITableViewCell() }
            cell.setupScrollView(recomend: recommends)
            return cell
        case .otherPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: ProfilePictureViewCell.self),
                for: indexPath
            ) as? ProfilePictureViewCell else { return UITableViewCell() }
            cell.configure(user: post[indexPath.row])
            return cell
        }
    }
}
