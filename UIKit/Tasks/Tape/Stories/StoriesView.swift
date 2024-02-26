// StoriesView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с историей
final class StoriesView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let verdana = "Verdana"
        static let sizeFont = 8
    }

    // MARK: - Visual Components

    private let storiesImageView = {
        let image = UIImageView()
        image.image = .womanInField
        image.layer.cornerRadius = 30
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    private let usernameLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    // MARK: - Life Cycle

    convenience init(stories: Stories) {
        self.init(frame: .zero)
        storiesImageView.image = UIImage(named: stories.nameImage)
        usernameLabel.text = stories.nameLabel
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews()
        setupConstraints()
    }

    // MARK: - Public Methods

    func editFirstElement() {
        usernameLabel.textColor = .gray
        storiesImageView.layer.cornerRadius = 0
    }

    // MARK: - Private Methods

    private func addSubviews() {
        addSubview(storiesImageView)
        addSubview(usernameLabel)
    }

    private func setupConstraints() {
        storiesImageView.translatesAutoresizingMaskIntoConstraints = false
        storiesImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        storiesImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        storiesImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true

        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        usernameLabel.topAnchor.constraint(equalTo: storiesImageView.bottomAnchor, constant: 5).isActive = true
        usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
    }
}
