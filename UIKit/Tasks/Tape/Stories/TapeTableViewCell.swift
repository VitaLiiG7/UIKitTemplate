// TapeTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка истории
final class TapeTableViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let verdana = "Verdana"
        static let sizeFont = 8
        static let startLead = 12
        static let topLead = 85
    }

    // MARK: - Visual Components

    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupScrollConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setupScrollView(stories: [StoriesView]) {
        var startLead = Constants.startLead
        for (index, item) in stories.enumerated() {
            if index == 0 {
                item.editFirstElement()
            }
            scrollView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
            item.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(startLead))
                .isActive = true
            item.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            item.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            item.widthAnchor.constraint(equalToConstant: 84).isActive = true
            item.heightAnchor.constraint(equalToConstant: 75).isActive = true
            item.heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
            if index == stories.count - 1 {
                item.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
            }
            startLead += Constants.topLead
        }
    }

    // MARK: - Private Methods

    private func setupScrollConstraints() {
        contentView.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        selectionStyle = .none
    }
}
