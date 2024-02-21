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
    }

    private let backgroundPostView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private let deleteRecommendationButton: UIButton = {
        let button = UIButton()
        button.setImage(.cross, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = .guy
        image.layer.cornerRadius = 55
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
        button.backgroundColor = UIColor(named: "buttonColor")
        button.setTitle(Constants.subscribe, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFont))
        button.layer.cornerRadius = CGFloat(Constants.buttonCornerRadius)
        return button
    }()

    convenience init(recommend: Recommend) {
        self.init(frame: .zero)
        avatarImageView.image = UIImage(named: recommend.avatarImage)
        usernameLabel.text = recommend.avatarName
        translatesAutoresizingMaskIntoConstraints = false
        setupView()
        constraint()
    }

    private func setupView() {
        [
            backgroundPostView,
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
        backgroundPostView.topAnchor.constraint(equalTo: topAnchor, constant: 45).isActive = true
        backgroundPostView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        backgroundPostView.widthAnchor.constraint(equalToConstant: 185).isActive = true
        backgroundPostView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        deleteRecommendationButton.topAnchor.constraint(equalTo: backgroundPostView.topAnchor, constant: 8.5)
            .isActive = true
//        deleteRecommendationButton.trailingAnchor.constraint(equalTo: backgroundPostView.trailingAnchor, constant: 8.5)
//            .isActive = true
        deleteRecommendationButton.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 19.5)
            .isActive = true
        deleteRecommendationButton.widthAnchor.constraint(equalToConstant: 7).isActive = true
        deleteRecommendationButton.heightAnchor.constraint(equalToConstant: 7).isActive = true

        avatarImageView.topAnchor.constraint(equalTo: backgroundPostView.topAnchor, constant: 15).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: backgroundPostView.leadingAnchor, constant: 35)
            .isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 115).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 115).isActive = true

        usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 5).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: backgroundPostView.leadingAnchor, constant: 42).isActive = true
        usernameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        usernameLabel.heightAnchor.constraint(equalToConstant: 12).isActive = true

//        subscribeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        subscribeButton.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 9).isActive = true
        subscribeButton.widthAnchor.constraint(equalToConstant: 165).isActive = true
        subscribeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        subscribeButton.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor).isActive = true
    }
}
