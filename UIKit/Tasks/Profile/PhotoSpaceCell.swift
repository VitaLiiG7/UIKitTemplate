// PhotoSpaceCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с фотографиями космоса
final class PhotoSpaceCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let number = 3
        static let scalingFactor = 3.04
    }

    // MARK: - Visual Components

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1.5
        layout.minimumLineSpacing = 1.5
        layout.itemSize = .init(
            width: UIScreen.main.bounds.width / Constants.scalingFactor,
            height: UIScreen.main.bounds.width / Constants.scalingFactor
        )
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Private Properties

    private var photos: [PhotoSpace] = []

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupcollectionView()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setupImage(item: [PhotoSpace]) {
        photos = item
        let height = (item.count / Constants.number) * Int(UIScreen.main.bounds.width) / Constants.number
        collectionView.heightAnchor.constraint(equalToConstant: CGFloat(height)).isActive = true
    }

    // MARK: - Private Methods

    private func setupcollectionView() {
        collectionView.dataSource = self
        collectionView.register(
            CollectionViewCell.self,
            forCellWithReuseIdentifier: String(describing: CollectionViewCell.self)
        )
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}

// MARK: - PhotoSpaceCell + UICollectionViewDataSource

extension PhotoSpaceCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView
            .dequeueReusableCell(
                withReuseIdentifier: String(describing: CollectionViewCell.self),
                for: indexPath
            ) as? CollectionViewCell else { return UICollectionViewCell() }
        cell.setupCollection(item: photos[indexPath.item])
        return cell
    }
}
