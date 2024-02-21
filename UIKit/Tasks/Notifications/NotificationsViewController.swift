// NotificationsViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран получения уведомлений
final class NotificationsViewController: UIViewController {
    // MARK: - Constants

    private enum Constants {
        static let titleText = "Уведомления"
        static let todayText = "Сегодня"
        static let upThisWeek = "На этой неделе"
        static let request = "Запросы на подписку"
    }

    // MARK: - Types

    private enum InstagramCells {
        case subscriptionRequests
        case today
        case forThisWeek
    }

    // MARK: - Private Properties

    private let messages: [InstagramCells] = [.subscriptionRequests, .today, .forThisWeek]

    private let todayNotifications: [Any] = [
        Notifications(
            nameImage: "woman",
            nameLabel: "lavanda123  понравился ваш \nкомментарий: \"Очень красиво!\" 5 ч",
            photoImage: "womanInField"
        ),
        Notifications(
            nameImage: "womanOld",
            nameLabel: "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо! 5 ч",
            photoImage: "castle"
        )
    ]

    private let lastWeekNotifications: [Any] = [
        Notifications(
            nameImage: "womanOld",
            nameLabel: "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо! 5 ч",
            photoImage: "castle"
        ),
        FollowerNotifications(
            nameImage: "woman",
            nameLabel: "lavanda123 появился(-ась) в RMLink. Вы можете быть знакомы 5 ч"
        ),
        FollowerNotifications(
            nameImage: "woman",
            nameLabel: "lavanda123 появился(-ась) в RMLink. Вы можете быть знакомы 5 ч"
        ),
        Notifications(
            nameImage: "womanOld",
            nameLabel: "lavanda123 упомянул(-а) вас в комментарии: @rm Спасибо! 5 ч",
            photoImage: "castle"
        ),
        FollowerNotifications(
            nameImage: "womanOld",
            nameLabel: "lavanda123 появился(-ась) в RMLink. Вы можете быть знакомы 5 ч"
        ),
        FollowerNotifications(
            nameImage: "womanOld",
            nameLabel: "lavanda128 появился(-ась) в RMLink. Вы можете быть знакомы 5 ч"
        )
    ]

    // MARK: - Visual Components

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(NotificationsCell.self, forCellReuseIdentifier: String(describing: NotificationsCell.self))
        table.register(
            NotificationsButtonCell.self,
            forCellReuseIdentifier: String(describing: NotificationsButtonCell.self)
        )
        return table

    }()

    // MARK: - Initializers

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        navigationItem.title = "Уведомления"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.dataSource = self
        tableView.delegate = self
    }

    private func setupConstraint() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
}

// MARK: NotificationsViewController + UITableViewDelegate

extension NotificationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}

// MARK: NotificationsViewController + UITableViewDataSource

extension NotificationsViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        messages.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch messages[section] {
        case .subscriptionRequests:
            return Constants.request
        case .today:
            return Constants.todayText
        case .forThisWeek:
            return Constants.upThisWeek
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let number = messages[section]
        switch number {
        case .subscriptionRequests:
            return 0
        case .today:
            return todayNotifications.count
        case .forThisWeek:
            return lastWeekNotifications.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = messages[indexPath.section]
        switch cell {
        case .subscriptionRequests:
            return UITableViewCell()
        case .today:
            if let item = todayNotifications[indexPath.row] as? Notifications {
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: NotificationsCell.self),
                    for: indexPath
                ) as? NotificationsCell else { return UITableViewCell() }
                cell.setupCell(user: item)
                return cell
            } else if let item = todayNotifications[indexPath.row] as? FollowerNotifications {
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: NotificationsButtonCell.self),
                    for: indexPath
                ) as? NotificationsButtonCell else { return UITableViewCell() }
                cell.setupCell(user: item)
                return cell
            }
        case .forThisWeek:
            if let item = lastWeekNotifications[indexPath.row] as? FollowerNotifications {
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: NotificationsButtonCell.self),
                    for: indexPath
                ) as? NotificationsButtonCell else { return UITableViewCell() }
                cell.setupCell(user: item)
                return cell
            } else if let item = lastWeekNotifications[indexPath.row] as? Notifications {
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: String(describing: NotificationsCell.self),
                    for: indexPath
                ) as? NotificationsCell else { return UITableViewCell() }
                cell.setupCell(user: item)
                return cell
            }
        }
        return UITableViewCell()
    }
}
