// ProfilePictureViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// аватарка с информацией
final class ProfilePictureViewCell: UITableViewCell {
    enum Constants {
        static let sizeFont = 8
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
        static let sizeFontLikes = 10
        static let like = "Нравится: 201"
        static let comment =
            "tur_v_dagestan Насладитесь красотой природы. Забронировать тур в Дагестан можно уже сейчас!"
        static let smallAvatarCornerRadius = 30
        static let leaveCommentLabel = "Комментировать ..."
        static let tenMinutesAgo = "10 минут назад"
    }

    // MARK: - Private Properties

    static let identifier = "ProfilePictureViewCell"

    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = .vitalik
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        return image
    }()

    private let ellipsisImageView: UIImageView = {
        let image = UIImageView()
        image.image = .ellipsis
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        return image
    }()

    private let landscapeImageView: UIImageView = {
        let image = UIImageView()
        image.image = .castle
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .center
        label.textColor = .black
        label.text = "tur_v_dagestan"
        return label
    }()

    private let heartImageView: UIImageView = {
        let image = UIImageView()
        image.image = .heart
        image.clipsToBounds = true
        return image
    }()

    private let commentsImageView: UIImageView = {
        let image = UIImageView()
        image.image = .comments
        image.clipsToBounds = true
        return image
    }()

    private let planeImageView: UIImageView = {
        let image = UIImageView()
        image.image = .plane
        image.clipsToBounds = true
        return image
    }()

    private let bookmarksImageView: UIImageView = {
        let image = UIImageView()
        image.image = .bookmarks
        image.clipsToBounds = true
        return image
    }()

    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFontLikes))
        label.textAlignment = .left
        label.text = Constants.like
        label.textColor = .black
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFontLikes))
        label.textAlignment = .left
        label.text = Constants.like
        label.textColor = .black
        return label
    }()

    private let smallAvatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = .vitalik
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        return image
    }()

    private let leaveCommentLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFontLikes))
        label.textAlignment = .left
        label.text = Constants.leaveCommentLabel
        label.textColor = .gray
        return label
    }()

//
//    private let leaveCommentLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFontLikes))
//        label.textAlignment = .left
//        label.text = Constants.tenMinutesAgo
//        label.textColor = .gray
//        return label
//    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func setupView() {
        for item in [
            avatarImageView,
            ellipsisImageView,
            landscapeImageView,
            usernameLabel,
            heartImageView,
            commentsImageView,
            planeImageView,
            bookmarksImageView,
            likesLabel,
            commentLabel,
            smallAvatarImageView,
            leaveCommentLabel
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
        }
    }

    private func setupCell() {
        avatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true

        ellipsisImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        ellipsisImageView.heightAnchor.constraint(equalToConstant: 2).isActive = true
        ellipsisImageView.topAnchor.constraint(equalTo: topAnchor, constant: 14).isActive = true
        ellipsisImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 14).isActive = true

        usernameLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true

        landscapeImageView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        landscapeImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
        landscapeImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        landscapeImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true

        heartImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        heartImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        heartImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        heartImageView.topAnchor.constraint(equalTo: landscapeImageView.bottomAnchor, constant: 12).isActive = true

        commentsImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        commentsImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        commentsImageView.leadingAnchor.constraint(equalTo: heartImageView.trailingAnchor, constant: 14).isActive = true
        commentsImageView.topAnchor.constraint(equalTo: landscapeImageView.bottomAnchor, constant: 11).isActive = true

        planeImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        planeImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        planeImageView.leadingAnchor.constraint(equalTo: commentsImageView.trailingAnchor, constant: 14.59)
            .isActive = true
        planeImageView.topAnchor.constraint(equalTo: landscapeImageView.bottomAnchor, constant: 11.63).isActive = true

        bookmarksImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        bookmarksImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        bookmarksImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14).isActive = true
        bookmarksImageView.topAnchor.constraint(equalTo: landscapeImageView.bottomAnchor, constant: 8).isActive = true

        likesLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        likesLabel.topAnchor.constraint(equalTo: commentsImageView.bottomAnchor, constant: 9).isActive = true

        commentLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        commentLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 6).isActive = true

        smallAvatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        smallAvatarImageView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 4).isActive = true
        smallAvatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        smallAvatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        leaveCommentLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        leaveCommentLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        leaveCommentLabel.leadingAnchor.constraint(equalTo: smallAvatarImageView.trailingAnchor, constant: 3)
            .isActive = true
        leaveCommentLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 6).isActive = true
    }

    func configure(user: Post) {
        avatarImageView.image = UIImage(named: user.nameImage)
        usernameLabel.text = user.nameLabel
    }
}
