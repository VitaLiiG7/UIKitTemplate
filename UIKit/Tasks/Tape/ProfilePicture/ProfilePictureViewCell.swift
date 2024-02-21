// ProfilePictureViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиля
final class ProfilePictureViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let sizeFont = 8
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
        static let sizeFontLikes = 10
        static let sizeUsername = 12
        static let like = "Нравится: 201"
        static let comment =
            "tur_v_dagestan Насладитесь красотой природы. \nЗабронировать тур в Дагестан можно уже сейчас!"
        static let smallAvatarCornerRadius = 30
        static let leaveCommentLabel = "Комментировать ..."
        static let tenMinutesAgo = "10 минут назад"
        static let xCoordinate = 0
    }

    // MARK: - Private Properties

    private let pageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()

    private let scrollView = UIScrollView()

    private let avatarImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.backgroundColor = .red
        return image
    }()

    private let ellipsisImageView = {
        let image = UIButton()
        image.setImage(.ellipsis, for: .normal)
        return image
    }()

    private let landscapeImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeUsername))
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    private let heartImageView = {
        let image = UIImageView()
        image.image = .heart
        image.clipsToBounds = true
        return image
    }()

    private let commentsImageView = {
        let image = UIImageView()
        image.image = .comments
        image.clipsToBounds = true
        return image
    }()

    private let planeImageView = {
        let image = UIImageView()
        image.image = .plane
        image.clipsToBounds = true
        return image
    }()

    private let bookmarksImageView = {
        let image = UIImageView()
        image.image = .bookmarks
        image.clipsToBounds = true
        return image
    }()

    private let likesLabel = {
        let label = UILabel()
        label.font = .init(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFontLikes))
        label.textAlignment = .left
        label.text = Constants.like
        label.textColor = .black
        return label
    }()

    private let commentLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFontLikes))
        label.textAlignment = .left
        label.text = Constants.comment
        label.textColor = .black
        return label
    }()

    private let smallAvatarImageView = {
        let image = UIImageView()
        image.image = .vitalik
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()

    private let leaveCommentLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFontLikes))
        label.textAlignment = .left
        label.text = Constants.leaveCommentLabel
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()

    private let tenMinutesAgoLabell = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFontLikes))
        label.textAlignment = .left
        label.text = Constants.tenMinutesAgo
        label.textColor = .gray
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
        setupScrollView()
        setupPageControl()
        setupScrollView()
        selectionStyle = .none
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func setupPageControl() {
        pageControl.addTarget(self, action: #selector(flippingPictures), for: .valueChanged)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
    }

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
            leaveCommentLabel,
            tenMinutesAgoLabell
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
        }
    }

    private func setupConstraints() {
        avatarImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true

        ellipsisImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        ellipsisImageView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        ellipsisImageView.centerYAnchor.constraint(equalTo: usernameLabel.centerYAnchor).isActive = true
        ellipsisImageView.centerXAnchor.constraint(equalTo: bookmarksImageView.centerXAnchor).isActive = true

        landscapeImageView.widthAnchor.constraint(equalToConstant: 375).isActive = true
        landscapeImageView.heightAnchor.constraint(equalToConstant: 239).isActive = true
        landscapeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        landscapeImageView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true

        bookmarksImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        bookmarksImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        bookmarksImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -14).isActive = true
        bookmarksImageView.centerYAnchor.constraint(equalTo: heartImageView.centerYAnchor).isActive = true

        smallAvatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        smallAvatarImageView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 4).isActive = true
        smallAvatarImageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        smallAvatarImageView.heightAnchor.constraint(equalToConstant: 20).isActive = true

        setupConstraintsLabel()
        setupConstraintsPostActions()
    }

    private func setupConstraintsLabel() {
        usernameLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 6).isActive = true

        likesLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        likesLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        likesLabel.topAnchor.constraint(equalTo: heartImageView.bottomAnchor, constant: 9).isActive = true

        commentLabel.widthAnchor.constraint(equalToConstant: 361).isActive = true
        commentLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        commentLabel.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 6).isActive = true

        leaveCommentLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        leaveCommentLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        leaveCommentLabel.leadingAnchor.constraint(equalTo: smallAvatarImageView.trailingAnchor, constant: 3)
            .isActive = true
        leaveCommentLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 6).isActive = true

        tenMinutesAgoLabell.topAnchor.constraint(equalTo: smallAvatarImageView.bottomAnchor, constant: 4)
            .isActive = true
        tenMinutesAgoLabell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        tenMinutesAgoLabell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12).isActive = true
        tenMinutesAgoLabell.widthAnchor.constraint(equalToConstant: 150).isActive = true
        tenMinutesAgoLabell.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
  private func setupConstraintsPostActions() {
        heartImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        heartImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        heartImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        heartImageView.topAnchor.constraint(equalTo: landscapeImageView.bottomAnchor, constant: 10).isActive = true

        commentsImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        commentsImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        commentsImageView.leadingAnchor.constraint(equalTo: heartImageView.trailingAnchor, constant: 14).isActive = true
        commentsImageView.centerYAnchor.constraint(equalTo: heartImageView.centerYAnchor).isActive = true

        planeImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        planeImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        planeImageView.leadingAnchor.constraint(equalTo: commentsImageView.trailingAnchor, constant: 14.59)
            .isActive = true
        planeImageView.centerYAnchor.constraint(equalTo: commentsImageView.centerYAnchor).isActive = true
    }

    // MARK: - Public Methods

    func configure(user: Post) {
        avatarImageView.image = UIImage(named: user.avatarImage)
        usernameLabel.text = user.avatarName
        likesLabel.text = user.likesCount
        commentLabel.text = user.lastComment
        landscapeImageView.image = UIImage(named: user.postImage[0])
        var xCoordinate = Constants.xCoordinate

        if user.postImage.count <= 1 {
            pageControl.isHidden = true
            landscapeImageView.image = UIImage(named: user.postImage[0])
        } else {
            for image in user.postImage {
                contentView.addSubview(pageControl)
                contentView.addSubview(scrollView)
                pageControl.numberOfPages = user.postImage.count

                let imageView = UIImageView()
                imageView.image = UIImage(named: image)
                imageView.frame = CGRect(x: xCoordinate, y: 0, width: Int(UIScreen.main.bounds.width), height: 239)
                scrollView.addSubview(imageView)
                xCoordinate += Int(UIScreen.main.bounds.width)
                pageControl.centerXAnchor.constraint(equalTo: landscapeImageView.centerXAnchor).isActive = true
                pageControl.topAnchor.constraint(equalTo: landscapeImageView.bottomAnchor, constant: 8).isActive = true
                scrollView.widthAnchor.constraint(equalToConstant: 375).isActive = true
                scrollView.heightAnchor.constraint(equalToConstant: 239).isActive = true
                scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
                scrollView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 10).isActive = true
            }
        }
    }

    @objc private func flippingPictures() {
        let ofsetX = UIScreen.main.bounds.width * CGFloat(pageControl.currentPage)
        scrollView.setContentOffset(CGPoint(x: ofsetX, y: 0), animated: true)
    }
}

// MARK: ProfilePictureViewCell + UIScrollViewDelegate

extension ProfilePictureViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
    }
}
