// UserView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс
class UserView: UIView {
    var thirdNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.frame = CGRect(x: 91, y: 25, width: 180, height: 20)
        label.text = "name"
        return label
    }()

    var dayTillBirthday: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 91, y: 53, width: 180, height: 20)
        label.text = "USer Birtchday"
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

    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.frame = CGRect(x: 8, y: 11, width: 75, height: 75)
        image.image = UIImage(named: "boy")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 12
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setupView() {
        addSubview(thirdNameLabel)
        addSubview(dayTillBirthday)
        addSubview(avatarImageView)
        addSubview(tillBirthday)
    }
}
