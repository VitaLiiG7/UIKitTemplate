// CollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка коллекции
final class CollectionViewCell: UICollectionViewCell {
    // MARK: - Visual Components

    private let storiesSpaceImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(storiesSpaceImageView)
        setupImageConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setupCollection(item: PhotoSpace) {
        storiesSpaceImageView.image = UIImage(named: item.imageName)
    }

    // MARK: - Private Methods

    private func setupImageConstraints() {
        storiesSpaceImageView.translatesAutoresizingMaskIntoConstraints = false
        storiesSpaceImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        storiesSpaceImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        storiesSpaceImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        storiesSpaceImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
