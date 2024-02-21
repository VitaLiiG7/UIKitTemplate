// NotificationsButtonCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка c изображением поста
class NotificationsButtonCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let sizeUsername = 12
        static let verdanaBold = "Verdana-Bold"
        static let verdana = "Verdana"
        static let subscribe = "Подписаться"
        static let sizeFont = 10
        static let buttonCornerRadius = 8
        static let buttonColor = "buttonColor"
    }

    // MARK: - Visual Components

    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = .vitalik
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeUsername))
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()

    private let subscribeButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: Constants.buttonColor)
        button.setTitle(Constants.subscribe, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFont))
        button.layer.cornerRadius = CGFloat(Constants.buttonCornerRadius)
        return button
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setupCell(user: FollowerNotifications) {
        avatarImageView.image = UIImage(named: user.nameImage)
        usernameLabel.text = user.nameLabel
    }

    // MARK: - Private Methods

    private func setupUI() {
        for item in [avatarImageView, usernameLabel, subscribeButton] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
            selectionStyle = .none
        }
    }

    private func setupConstraint() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6).isActive = true

        usernameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: 154).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true

        subscribeButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 140).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscribeButton.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
    }
}
