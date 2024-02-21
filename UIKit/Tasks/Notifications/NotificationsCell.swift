// NotificationsCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка для уведомлений с кнопкой
class NotificationsCell: UITableViewCell {
    enum Constants {
        static let comment =
            "tur_v_dagestan Насладитесь красотой природы. \nЗабронировать тур в Дагестан можно уже сейчас!"
        static let sizeUsername = 12
        static let verdanaBold = "Verdana-Bold"
    }

    static let identifier = "NotificationsCell"

    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = .vitalik
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()

    private let photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = .castle
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeUsername))
        label.textAlignment = .left
        label.textColor = .black
        label.numberOfLines = 0
        label.text = Constants.comment
        return label
    }()

    private let heartImageView: UIImageView = {
        let image = UIImageView()
        image.image = .vitalik
        image.clipsToBounds = true
        return image
    }()

    private let answerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeUsername))
        label.textAlignment = .left
        label.textColor = .gray
        label.text = Constants.comment
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        for item in [avatarImageView, usernameLabel, photoImageView] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
        }
    }

    private func setupConstraint() {
        avatarImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true

        usernameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 7).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: 240).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true

        photoImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    func configure(user: Notifications) {
        avatarImageView.image = UIImage(named: user.nameImage)
        usernameLabel.text = user.nameLabel
        photoImageView.image = UIImage(named: user.photoImage)
    }
}
