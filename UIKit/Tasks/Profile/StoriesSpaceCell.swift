// StoriesSpaceCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка сториз
final class StoriesSpaceCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let startLead = 90.0
        static let start = 0.0
        static let startScroll = 65.0
        static let startWidht = 85.0
    }

    // MARK: - Visual Components

    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setupScrollView(items: [StoriesSpace]) {
        var startWidht = Constants.start
        var startScroll: CGFloat = Constants.start
        for index in 0 ..< items.count {
            let storiesCell = StoriesCellView(storiesSpace: items[index])
            scrollView.addSubview(storiesCell)
            storiesCell.translatesAutoresizingMaskIntoConstraints = false
            storiesCell.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: startScroll)
                .isActive = true
            storiesCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
            storiesCell.heightAnchor.constraint(equalToConstant: 99).isActive = true
            storiesCell.widthAnchor.constraint(equalToConstant: 85).isActive = true
            startScroll += Constants.startScroll
            startWidht += Constants.startWidht
        }
        scrollView.contentSize = CGSize(width: startWidht, height: 99)
    }

    // MARK: - Private Methods

    private func setupView() {
        contentView.addSubview(scrollView)
        selectionStyle = .none
    }

    private func setupConstraints() {
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
}
