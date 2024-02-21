// RecommendationsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка с рекомендациями
final class RecommendationsViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let sizeFont = 10
        static let verdanaBold = "Verdana-Bold"
        static let recommendText = "Рекомендуем вам"
        static let all = "Все"
        static let startLead = 17
        static let topLead = 205
    }

    // MARK: - Private Properties

    private let scrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let recommendLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .center
        label.textColor = .black
        label.text = Constants.recommendText
        return label
    }()

    private let allLabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .right
        label.textColor = .button
        label.text = Constants.all
        return label
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        contentView.backgroundColor = .myBackground
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Public Methods

    func setupScrollView(recomend: [RecommendView]) {
        var startLead = Constants.startLead
        for (index, item) in recomend.enumerated() {
            scrollView.addSubview(item)
            item.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(startLead))
                .isActive = true
            item.topAnchor.constraint(equalTo: recommendLabel.topAnchor, constant: 21).isActive = true
            item.widthAnchor.constraint(equalToConstant: 184).isActive = true
            item.heightAnchor.constraint(equalToConstant: 220).isActive = true
            item.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -10).isActive = true
            scrollView.heightAnchor.constraint(equalTo: item.heightAnchor).isActive = true
            if index == recomend.count - 1 {
                item.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
            }
            startLead += Constants.topLead
        }
    }

    // MARK: - Private Methods

    private func setupConstraints() {
        contentView.addSubview(scrollView)
        contentView.addSubview(recommendLabel)
        contentView.addSubview(allLabel)
        scrollView.topAnchor.constraint(equalTo: recommendLabel.bottomAnchor, constant: 21).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -25).isActive = true

        recommendLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        recommendLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        recommendLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 9).isActive = true
        recommendLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        recommendLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -250).isActive = true

        allLabel.translatesAutoresizingMaskIntoConstraints = false
        allLabel.centerYAnchor.constraint(equalTo: recommendLabel.centerYAnchor).isActive = true
        allLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        allLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        allLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        selectionStyle = .none
    }
}
