// TapeTableViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// ячейка с историей
class TapeTableViewCell: UITableViewCell {
    private enum Constants {
        static let verdana = "Verdana"
        static let sizeFont = 8
    }

    static let identifier = "TapeTableViewCell"

    // MARK: - Private Properties

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupScrollView(stories: [StoriesView]) {
        var startLead = 12
        scrollView.contentSize = CGSize(width: 85, height: 75)
        for item in stories {
            scrollView.addSubview(item)
            item.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(startLead))
                .isActive = true
            item.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            item.widthAnchor.constraint(equalToConstant: 84).isActive = true
            item.heightAnchor.constraint(equalToConstant: 75).isActive = true
            startLead += 85
            scrollView.contentSize.width += 85
        }
    }

    private func setupConstraint() {
        contentView.addSubview(scrollView)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}
