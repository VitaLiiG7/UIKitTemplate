// RecommendView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// для отображения в ячейки рекомендации
class RecommendView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let sizeFont = 10
        static let verdana = "Verdana"
        static let verdanaBold = "Verdana-Bold"
        static let names = ["tur_v_dagestan", "mary_pol", "mary_pol"]
        static let buttonCornerRadius = 8
        static let recommendText = "Рекомендуем вам"
        static let subscribe = "Подписаться"
        static let buttonColor = "buttonColor"
    }

    // MARK: - Visual Components

    private let deleteRecommendationButton: UIButton = {
        let button = UIButton()
        button.setImage(.cross, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = .guy
        image.layer.cornerRadius = 50
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .center
        label.textColor = .black
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

    convenience init(recommend: Recommend) {
        self.init(frame: .zero)
        avatarImageView.image = UIImage(named: recommend.avatarImage)
        usernameLabel.text = recommend.avatarName
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
        constraint()
        backgroundColor = .white
    }

    // MARK: - Private Methods

    private func setupView() {
        [
            deleteRecommendationButton,
            avatarImageView,
            usernameLabel,
            subscribeButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
    }

    private func constraint() {
        deleteRecommendationButton.topAnchor.constraint(equalTo: topAnchor, constant: 25)
            .isActive = true
        deleteRecommendationButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.5)
            .isActive = true
        deleteRecommendationButton.widthAnchor.constraint(equalToConstant: 12).isActive = true
        deleteRecommendationButton.heightAnchor.constraint(equalToConstant: 12).isActive = true

        avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 25).isActive = true
        avatarImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true

        usernameLabel.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 42).isActive = true

        subscribeButton.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 9).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscribeButton.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor).isActive = true
        subscribeButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
    }
}
