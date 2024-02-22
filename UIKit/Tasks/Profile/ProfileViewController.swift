// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// экран профиль человека
final class ProfileViewController: UIViewController {
    
    // MARK: - Types

    private enum CellTypes {
        ///  Профиль пользователя
        case profile
        /// Истории пользователя
        case stories
        ///  Фотографии пользователя
        case userPhotos
    }
    
    // MARK: - Constants

    enum Constants {
        static let nameUser = "mary_rmLink"
        static let fontVerdanaBold = "Verdana-Bold"
        static let nameUserSize = 18.0
    }

    // MARK: - Private Properties
    
    private let posts: [CellTypes] = [.profile, .stories, .userPhotos]
    
    // MARK: - Visual Components

    private let tableView = {
        let table = UITableView()
        table.register(ProfileViewCell.self, forCellReuseIdentifier: String(describing: ProfileViewCell.self))
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationItem()
    }

    // MARK: - Private Methods

    private func setNavigationItem() {
        let plusBarButtonItemRich = UIBarButtonItem(image: .plus, style: .done, target: nil, action: nil)
        let listBarButtonItemRich = UIBarButtonItem(image: .list, style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [listBarButtonItemRich, plusBarButtonItemRich]
        navigationItem.rightBarButtonItems?[0].tintColor = .black
        navigationItem.rightBarButtonItems?[1].tintColor = .black

        let latchBarButtonItemLeft = UIBarButtonItem(image: .latch, style: .done, target: nil, action: nil)
        let usernameLabel = UIBarButtonItem(title: Constants.nameUser, style: .done, target: nil, action: nil)
        usernameLabel.tintColor = .black
        usernameLabel.setTitleTextAttributes(
            [
                NSAttributedString.Key
                    .font: UIFont(name: Constants.fontVerdanaBold, size: Constants.nameUserSize) ?? UIFont
                    .systemFont(ofSize: 10)
            ],
            for: .normal
        )
        navigationItem.leftBarButtonItems = [latchBarButtonItemLeft, usernameLabel]
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    private func setupTableViewConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}

 extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let posts = posts[section]
        switch posts {
        case .profile, .stories, .userPhotos:
           return 1
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = posts[indexPath.row]
        switch cell {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileViewCell.self), for: indexPath) as? ProfileViewCell else { return UITableViewCell() }
            return cell
        case .stories:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileViewCell.self), for: indexPath) as? ProfileViewCell else { return UITableViewCell() }
            return cell
        case .userPhotos:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileViewCell.self), for: indexPath) as? ProfileViewCell else { return UITableViewCell() }
            return cell
        }
    }
 }
