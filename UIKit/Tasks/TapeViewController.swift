// TapeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс Вью Контроллер
final class TapeViewController: UIViewController, UITableViewDelegate {
    private let tableView: UITableView = {
        let table = UITableView() /* frame: .zero, style: .grouped) */
        table.register(TapeTableViewCell.self, forCellReuseIdentifier: TapeTableViewCell.identifier)
        table.register(ProfilePictureViewCell.self, forCellReuseIdentifier: ProfilePictureViewCell.identifier)
        return table
    }()

    let array = [
        StoriesView(stories: Post(nameImage: "woman", nameLabel: "Юлия")),
        StoriesView(stories: Post(nameImage: "womanInField", nameLabel: "Алла")),
        StoriesView(stories: Post(nameImage: "womanOld", nameLabel: "Кристина")),
        StoriesView(stories: Post(nameImage: "vitalik", nameLabel: "Виталий")),
        StoriesView(stories: Post(nameImage: "theGuyHorses", nameLabel: "Игнат")),
        StoriesView(stories: Post(nameImage: "guy", nameLabel: "Руслан")),
        StoriesView(stories: Post(nameImage: "womanOld", nameLabel: "Ирина"))
    ]

    let mystruct = Mysturt.installPosts()
//    let myStruct = Mysturt.installPosts()
//    let userStories = [
//        UserStories(nameImage: "womanInField", nameLabel: "Лаванда123"),
//        UserStories(nameImage: "woman", nameLabel: "Лаванда124"),
//        UserStories(nameImage: "vitalik", nameLabel: "Лаванда125"),
//        UserStories(nameImage: "theGuyHorses", nameLabel: "Лаванда126"),
//        UserStories(nameImage: "womanInField", nameLabel: "Лаванда127"),
//        UserStories(nameImage: "guy", nameLabel: "Лаванда128"),
//    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItem()
        setupUI()
        constraints()
        view.backgroundColor = .white
    }

    // MARK: - Private Methods

    private func setupUI() {
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

extension TapeViewController: UITabBarDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
}

extension TapeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TapeTableViewCell.identifier,
                for: indexPath
            ) as? TapeTableViewCell else { return UITableViewCell() }
            cell.setupScrollView(stories: array)
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfilePictureViewCell.identifier,
                for: indexPath
            ) as? ProfilePictureViewCell else { return UITableViewCell() }
            cell.configure(user: mystruct[indexPath.row])
            return cell
        }
    }
}

//        guard let cell = tableView.dequeueReusableCell(
//            withIdentifier: TapeTableViewCell.identifier,
//            for: indexPath
//        ) as? TapeTableViewCell else {
//            return UITableViewCell()
//        }
//        cell.setupScrollView(stories: array)
//        return cell
