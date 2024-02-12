// UserView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для переиспользования лейблов, изображения
class UserView: UIView {
    // MARK: - Public Properties

    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 8, y: 11, width: 75, height: 75)
        image.image = .boy
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        return image
    }()

    var thirdNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.frame = CGRect(x: 91, y: 25, width: 180, height: 20)
        label.text = "name"
        return label
    }()

    var dayBirthday: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 91, y: 53, width: 180, height: 20)
        label.text = "User Birthday"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 17 / 255.0, green: 17 / 255.0, blue: 17 / 255.0, alpha: 1)
        return label
    }()

    var tillBirthday: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 295, y: 25, width: 42, height: 44)
        label.font = UIFont(name: "Verdana-Bold", size: 16)
        label.textAlignment = .center
        label.textColor = UIColor(named: "labelColor")
        label.numberOfLines = 0
        return label
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func setupView() {
        addSubview(thirdNameLabel)
        addSubview(dayBirthday)
        addSubview(avatarImageView)
        addSubview(tillBirthday)
    }
}
