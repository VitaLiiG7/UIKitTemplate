// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиль человека
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

    // MARK: - Visual Components

    private let tableView = {
        let table = UITableView()
        table.register(ProfileViewCell.self, forCellReuseIdentifier: String(describing: ProfileViewCell.self))
        table.register(StoriesSpaceCell.self, forCellReuseIdentifier: String(describing: StoriesSpaceCell.self))
        table.register(PhotoSpaceCell.self, forCellReuseIdentifier: String(describing: PhotoSpaceCell.self))
        table.showsVerticalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    private let usernameButton = {
        let button = UIButton()
        button.setTitle(Constants.nameUser, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.nameUserSize)
        return button
    }()

    private let latchButton = {
        let button = UIButton()
        button.setImage(.lock, for: .normal)
        return button
    }()

    private let plusButton = {
        let button = UIButton()
        button.setImage(.plus, for: .normal)
        return button
    }()

    private let listButton = {
        let button = UIButton()
        button.setImage(.list, for: .normal)
        return button
    }()

    // MARK: - Private Properties

    private let posts: [CellTypes] = [.profile, .stories, .userPhotos]
    private let storiesSpace = StoriesSpace.makeProfile()
    private let myPhotoSpale = PhotoSpace.makePhotoSpace()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setNavigationItem()
        setupTableViewConstraints()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
    }

    private func setNavigationItem() {
        let latchBarButtonItemLeft = UIBarButtonItem(customView: latchButton)
        let usernameLabelButtonItemLeft = UIBarButtonItem(customView: usernameButton)
        let plusBarButtonItemRich = UIBarButtonItem(customView: plusButton)
        let listButtonItemRich = UIBarButtonItem(customView: listButton)

        navigationItem.rightBarButtonItems = [listButtonItemRich, plusBarButtonItemRich]
        navigationItem.leftBarButtonItems = [latchBarButtonItemLeft, usernameLabelButtonItemLeft]
        navigationItem.leftBarButtonItem?.tintColor = .black
    }

    private func setupTableViewConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
}

// MARK: - ProfileViewController + UITableViewDataSource

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
        let cell = posts[indexPath.section]
        switch cell {
        case .profile:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: ProfileViewCell.self),
                for: indexPath
            ) as? ProfileViewCell else { return UITableViewCell() }
            let button = cell.getButton()
            button.addTarget(self, action: #selector(openWebView), for: .touchUpInside)
            return cell
        case .stories:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: StoriesSpaceCell.self),
                for: indexPath
            ) as? StoriesSpaceCell else { return UITableViewCell() }
            cell.setupScrollView(items: storiesSpace)
            return cell
        case .userPhotos:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: String(describing: PhotoSpaceCell.self),
                for: indexPath
            ) as? PhotoSpaceCell else { return UITableViewCell() }
            cell.setupImage(item: myPhotoSpale)
            return cell
        }
    }

    @objc private func openWebView() {
        let modalViewController = WKWebViewController()
        present(modalViewController, animated: true)
    }
}
