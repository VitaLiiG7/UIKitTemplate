// TapeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Вью Контроллер
final class TapeViewController: UIViewController {
    // MARK: - Constants

    enum InstagramCells {
        case stories
        case firstPost
        case recommendations
        case otherPosts
    }

    private let posts: [InstagramCells] = [.stories, .firstPost, .recommendations, .otherPosts]

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(TapeTableViewCell.self, forCellReuseIdentifier: TapeTableViewCell.identifier)
        table.register(ProfilePictureViewCell.self, forCellReuseIdentifier: ProfilePictureViewCell.identifier)
        table.register(RecommendationsViewCell.self, forCellReuseIdentifier: RecommendationsViewCell.identifier)
        table.showsVerticalScrollIndicator = false
        return table
    }()

    let stories = [
        StoriesView(stories: Stories(nameImage: "woman", nameLabel: "Ваша история")),
        StoriesView(stories: Stories(nameImage: "womanInField", nameLabel: "Алла")),
        StoriesView(stories: Stories(nameImage: "womanOld", nameLabel: "Кристина")),
        StoriesView(stories: Stories(nameImage: "vitalik", nameLabel: "Виталий")),
        StoriesView(stories: Stories(nameImage: "theGuyHorses", nameLabel: "Игнат")),
        StoriesView(stories: Stories(nameImage: "guy", nameLabel: "Руслан")),
        StoriesView(stories: Stories(nameImage: "womanOld", nameLabel: "Ирина"))
    ]

    var post: [Post] = [
        .init(
            avatarImage: "womanInField",
            avatarName: "Галина",
            postImage: ["castle", "vitalik", "theGuyHorses"],
            likesCount: "Нравится: 201",
            lastComment: "tur_v_dagestan Насладитесь красотой природы. \nЗабронировать тур в Дагестан можно уже сейчас!"
        ),
        .init(
            avatarImage: "vitalik",
            avatarName: "Vitalii",
            postImage: ["theGuyHorses", "castle", "castle"],
            likesCount: "Нравится: 220",
            lastComment: "tur_v_dagestan Насладитесь красотой природы. \nЗабронировать тур в Дагестан можно уже сейчас!"
        ),
        .init(
            avatarImage: "womanOld",
            avatarName: "Любовь",
            postImage: ["castle", "womanInField"],
            likesCount: "Нравится: 209",
            lastComment: "tur_v_dagestan Насладитесь красотой природы. \nЗабронировать тур в Дагестан можно уже сейчас!"
        )
    ]

    let recomend = [
        RecommendView(recommend: Recommend(avatarImage: "vitalik", avatarName: "Alan")),
        RecommendView(recommend: Recommend(avatarImage: "womanInField", avatarName: "Ivanre")),
        RecommendView(recommend: Recommend(avatarImage: "castle", avatarName: "Ruslan")),
        RecommendView(recommend: Recommend(avatarImage: "womanInField", avatarName: "Alina"))
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        setupUI()
        constraints()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setNavigationItem() {
        let rmLink = UIBarButtonItem(image: .rmLink, style: .done, target: nil, action: nil)
        let message = UIBarButtonItem(image: .message, style: .done, target: nil, action: nil)
        navigationItem.leftBarButtonItem = rmLink
        navigationItem.rightBarButtonItem = message
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

    private func constraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension TapeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = posts[indexPath.section]
        switch cell {
        case .stories:
            return 75
        case .firstPost:
            return 450
        case .recommendations:
            return 270
        case .otherPosts:
            return 450
        }
    }
}

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
                withIdentifier: TapeTableViewCell.identifier,
                for: indexPath
            ) as? TapeTableViewCell else { return UITableViewCell() }
            cell.setupScrollView(stories: stories)
            return cell
        case .firstPost:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfilePictureViewCell.identifier,
                for: indexPath
            ) as? ProfilePictureViewCell else { return UITableViewCell() }
            cell.configure(user: post[0])
            return cell
        case .recommendations:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: RecommendationsViewCell.identifier,
                for: indexPath
            ) as? RecommendationsViewCell else { return UITableViewCell() }
            cell.setupScrollView(recomend: recomend)
            return cell
        case .otherPosts:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfilePictureViewCell.identifier,
                for: indexPath
            ) as? ProfilePictureViewCell else { return UITableViewCell() }
            cell.configure(user: post[indexPath.row])
            return cell
        }
    }
}
