// ProfileViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка профиля
final class ProfileViewCell: UITableViewCell {
    // MARK: - Constants

    enum Constants {
        static let fontVerdanaBold = "Verdana-Bold"
        static let fontVerdana = "Verdana"
        static let fontVerdanaSize = 14.0
        static let changeTextSize = 10
        static let nameSite = "📎www.spacex.com"
        static let colorChangeButton = "colorChangeButton"
        static let changeText = "Изменить"
        static let shareProfile = "Поделиться профилем"
    }

    // MARK: - Visual Components

    private let avatarImageView = {
        let image = UIImageView()
        image.image = .myAvatar
        image.layer.cornerRadius = 60
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.fontVerdanaSize)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    private let professionLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: Constants.fontVerdanaSize)
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()

    private let goingTositeButton = {
        let button = UIButton()
        button.setTitle(Constants.nameSite, for: .normal)
        button.setTitleColor(.colorSiteName, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.fontVerdanaSize)
        return button
    }()

    private let changeProfileButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: Constants.colorChangeButton)
        button.setTitle(Constants.changeText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.changeTextSize))
        button.layer.cornerRadius = 8
        return button
    }()

    private let shareProfileButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: Constants.colorChangeButton)
        button.setTitle(Constants.shareProfile, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.changeTextSize))
        button.layer.cornerRadius = 8
        return button
    }()

    private let addButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: Constants.colorChangeButton)
        button.setImage(.add, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    // MARK: - Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview()
        setupConstraints()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        contentView.backgroundColor = .white
    }

    // MARK: - Private Methods

    private func addSubview() {
        for item in [
            avatarImageView,
            usernameLabel,
            professionLabel,
            goingTositeButton,
            changeProfileButton,
            shareProfileButton,
            addButton
        ] {
            item.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(item)
        }
    }

    private func setupConstraints() {
        setupImageConstraints()
        setupLabelConstraints()
        setupButtonConstraints()
    }

    private func setupImageConstraints() {
        avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }

    private func setupLabelConstraints() {
        usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 9).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: 170).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        professionLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 11).isActive = true
        professionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        professionLabel.widthAnchor.constraint(equalToConstant: 298).isActive = true
        professionLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }

    private func setupButtonConstraints() {
        goingTositeButton.topAnchor.constraint(equalTo: professionLabel.bottomAnchor, constant: 6).isActive = true
        goingTositeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        goingTositeButton.widthAnchor.constraint(equalToConstant: 298).isActive = true
        goingTositeButton.heightAnchor.constraint(equalToConstant: 17).isActive = true

        changeProfileButton.topAnchor.constraint(equalTo: goingTositeButton.bottomAnchor, constant: 15).isActive = true
        changeProfileButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        changeProfileButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        changeProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true

        shareProfileButton.centerXAnchor.constraint(equalTo: changeProfileButton.centerXAnchor).isActive = true
        shareProfileButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: 5).isActive = true
        shareProfileButton.leadingAnchor.constraint(equalTo: changeProfileButton.trailingAnchor, constant: 5)
            .isActive = true
        shareProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
    }
}
