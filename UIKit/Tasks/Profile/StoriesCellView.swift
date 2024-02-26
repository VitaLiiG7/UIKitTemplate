// StoriesCellView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью с историей
final class StoriesCellView: UIView {
    // MARK: - Constants

    private enum Constants {
        static let verdana = "Verdana"
        static let sizeFont = 10.0
    }

    // MARK: - Visual Components

    private let storiesSpaceImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    private let usernameSpaceLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: Constants.sizeFont)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    private let circleImage = {
        let image = UIImageView()
        image.layer.cornerRadius = 25
        image.image = UIImage(named: "circle")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    // MARK: - Life Cycle

    convenience init(storiesSpace: StoriesSpace) {
        self.init(frame: .zero)
        addSubviews()
        storiesSpaceImageView.image = UIImage(named: storiesSpace.spaceImageName)
        usernameSpaceLabel.text = storiesSpace.spaceUserName
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
    }

    // MARK: - Private Methods

    private func addSubviews() {
        addSubview(storiesSpaceImageView)
        addSubview(usernameSpaceLabel)
        addSubview(circleImage)
    }

    private func setupConstraints() {
        storiesSpaceImageView.translatesAutoresizingMaskIntoConstraints = false
        storiesSpaceImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18).isActive = true
        storiesSpaceImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        storiesSpaceImageView.widthAnchor.constraint(equalToConstant: 49).isActive = true
        storiesSpaceImageView.heightAnchor.constraint(equalToConstant: 49).isActive = true

        circleImage.translatesAutoresizingMaskIntoConstraints = false
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        circleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        circleImage.topAnchor.constraint(equalTo: topAnchor, constant: 17).isActive = true
        circleImage.widthAnchor.constraint(equalToConstant: 55).isActive = true
        circleImage.heightAnchor.constraint(equalToConstant: 55).isActive = true

        usernameSpaceLabel.translatesAutoresizingMaskIntoConstraints = false
        usernameSpaceLabel.topAnchor.constraint(equalTo: storiesSpaceImageView.bottomAnchor, constant: 4)
            .isActive = true
        usernameSpaceLabel.centerXAnchor.constraint(equalTo: storiesSpaceImageView.centerXAnchor).isActive = true
    }
}
