// RecommendationsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка
class RecommendationsViewCell: UITableViewCell {
    // MARK: - Constants

    private enum Constants {
        static let sizeFont = 10
        static let verdanaBold = "Verdana-Bold"
        static let recommendText = "Рекомендуем вам"
        static let all = "Все"
    }

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .myBackground
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    static let identifier = "RecommendationsViewCell"

    private let recommendLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .center
        label.textColor = .black
        label.text = Constants.recommendText
        return label
    }()

    private let allLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdanaBold, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .right
        label.textColor = .button
        label.text = Constants.all
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraint()
//        contentView.backgroundColor = backgroundColor
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupScrollView(recomend: [RecommendView]) {
        var startLead = 17
        scrollView.contentSize = CGSize(width: 185, height: 200)
        for item in recomend {
            scrollView.addSubview(item)
            item.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: CGFloat(startLead))
                .isActive = true
            item.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            item.widthAnchor.constraint(equalToConstant: 184).isActive = true
            item.heightAnchor.constraint(equalToConstant: 200).isActive = true
            startLead += 205
            scrollView.contentSize.width += 205
        }
    }

    private func setupConstraint() {
        contentView.addSubview(scrollView)
        contentView.addSubview(recommendLabel)
        contentView.addSubview(allLabel)
        scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        recommendLabel.translatesAutoresizingMaskIntoConstraints = false
        recommendLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        recommendLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        recommendLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        recommendLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true

        allLabel.translatesAutoresizingMaskIntoConstraints = false
        allLabel.topAnchor.constraint(equalTo: topAnchor, constant: 9).isActive = true
        allLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        allLabel.widthAnchor.constraint(equalToConstant: 107).isActive = true
        allLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
}
