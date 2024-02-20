// RecommendationsViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка
class RecommendationsViewCell: UITableViewCell {
    private let backgroundPostView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "backgroundColor")

        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
