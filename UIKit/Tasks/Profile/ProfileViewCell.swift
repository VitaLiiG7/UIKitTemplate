// ProfileViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка профиля
final class ProfileViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let fontVerdanaBold = "Verdana-Bold"
        static let fontVerdana = "Verdana"
        static let fontVerdanaSize = 14.0
        static let changeTextSize = 10.0
        static let nameSite = "📎www.spacex.com"
        static let colorChangeButton = "colorChangeButton"
        static let changeText = "Изменить"
        static let shareProfile = "Поделиться профилем"
        static let name = "Мария Иванова"
        static let consultantText = "Консультат"
        static let startLeadQuantityLabel = 56.0
        static let startLeadInformationLabel = 46.0
        static let topLead = 70.0
    }

    // MARK: - Visual Components

    private let avatarImageView = {
        let image = UIImageView()
        image.image = .myAvatar
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.fontVerdanaSize)
        label.textAlignment = .left
        label.text = Constants.name
        label.textColor = .black
        return label
    }()

    private let professionLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.fontVerdana, size: Constants.fontVerdanaSize)
        label.textAlignment = .left
        label.text = Constants.consultantText
        label.textColor = .black
        return label
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
        button.setImage(.addUser, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    private lazy var goingTositeButton = {
        let button = UIButton()
        button.setTitle(Constants.nameSite, for: .normal)
        button.setTitleColor(.colorSiteName, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont(name: Constants.fontVerdana, size: Constants.fontVerdanaSize)
        return button
    }()

    // MARK: - Private Properties

    private let count = [67, 458, 120]
    private let informations = ["публикации", "подписчики", "подписки"]

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
        setupConstraints()
        setupLabel()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func getButton() -> UIButton {
        goingTositeButton
    }

    // MARK: - Private Methods
    
    private func setupUI() {
        contentView.backgroundColor = .white
        selectionStyle = .none
    }

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
        changeProfileButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        changeProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true

        changeProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true

        shareProfileButton.centerYAnchor.constraint(equalTo: changeProfileButton.centerYAnchor).isActive = true
        shareProfileButton.widthAnchor.constraint(equalToConstant: 155).isActive = true
        shareProfileButton.leadingAnchor.constraint(equalTo: changeProfileButton.trailingAnchor, constant: 5)
            .isActive = true
        shareProfileButton.heightAnchor.constraint(equalToConstant: 27).isActive = true

        addButton.centerYAnchor.constraint(equalTo: changeProfileButton.centerYAnchor).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 27).isActive = true
        addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
        addButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }

    private func setupLabel() {
        var startLeadQuantityLabel = Constants.startLeadQuantityLabel
        var startLeadInformationLabel = Constants.startLeadInformationLabel
        for (index, item) in informations.enumerated() {
            let quantityLabel = {
                let label = UILabel()
                label.font = UIFont(name: Constants.fontVerdanaBold, size: Constants.fontVerdanaSize)
                label.textAlignment = .center
                label.text = "\(count[index])"
                label.textColor = .black
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()

            let informationLabel = {
                let label = UILabel()
                label.font = UIFont(name: Constants.fontVerdana, size: Constants.changeTextSize)
                label.textAlignment = .center
                label.textColor = .black
                label.text = "\(informations[index])"
                label.translatesAutoresizingMaskIntoConstraints = false
                return label
            }()

            contentView.addSubview(quantityLabel)
            contentView.addSubview(informationLabel)

            quantityLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 20
            ).isActive = true
            quantityLabel.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor,
                constant: startLeadQuantityLabel
            ).isActive = true
            quantityLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
            quantityLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

            informationLabel.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 2).isActive = true
            informationLabel.leadingAnchor.constraint(
                equalTo: avatarImageView.trailingAnchor,
                constant: startLeadInformationLabel
            ).isActive = true
            informationLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
            informationLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true
            startLeadQuantityLabel += Constants.topLead
            startLeadInformationLabel += Constants.topLead
        }
    }
}
