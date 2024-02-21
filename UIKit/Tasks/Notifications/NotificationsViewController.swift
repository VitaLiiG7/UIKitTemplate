// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран получения уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let titleText = "Уведомления"
        static let todayText = "Сегодня"
        static let upThisWeek = "На этой неделе"
    }

    enum InstagramCells {
//        case subscriptionRequests
//        case today
        case notificationsButton
        case notifications
    }

    private let messages: [InstagramCells] = [.notifications, .notificationsButton]

    private let array: [Notifications] = [
        .init(
            nameImage: "woman",
            nameLabel: "lavanda123  понравился ваш \nкомментарий: \"Очень красиво!\"",
            photoImage: "womanInField"
        ),
        .init(
            nameImage: "womanOld",
            nameLabel: "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо! ",
            photoImage: "castle"
        ),
        .init(nameImage: "vitalik", nameLabel: "Maks", photoImage: "womanOld"),
        .init(nameImage: "theGuyHorses", nameLabel: "Artem", photoImage: "theGuyHorses"),
    ]

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NotificationsCell.self, forCellReuseIdentifier: NotificationsCell.identifier)
        table.register(NotificationsButtonCell.self, forCellReuseIdentifier: NotificationsButtonCell.identifier)
        return table

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupConstraint() {
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = messages[indexPath.section]
        switch cell {
        case .notifications:
            return 50
        case .notificationsButton:
            return 50
        }
    }
}

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        messages.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let number = messages[section]
        switch number {
        case .notifications, .notificationsButton:
            return 4
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messages[indexPath.section]
        switch cell {
        case .notifications:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationsCell.identifier,
                for: indexPath
            ) as? NotificationsCell else { return UITableViewCell() }
            cell.configure(user: array[indexPath.row])
            return cell
        case .notificationsButton:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: NotificationsButtonCell.identifier,
                for: indexPath
            ) as? NotificationsButtonCell else { return UITableViewCell() }
            return cell
        }
    }
}
