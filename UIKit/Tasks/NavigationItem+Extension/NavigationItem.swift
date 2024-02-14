// NavigationItem.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Расширение для кнопки навигейшинконтроллера
extension CoffeeSelectionViewController {
    func setNavigationItemLeft() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 35, y: 61, width: 44, height: 44))
        button.layer.cornerRadius = 22
        button.setImage(UIImage(named: "arrow"), for: .normal)
        button.clipsToBounds = true
        button.backgroundColor = UIColor(red: 235 / 255.0, green: 246 / 255.0, blue: 247 / 255.0, alpha: 1)
        button.addTarget(self, action: #selector(popBackLeft), for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        navigationItem.leftBarButtonItem = item
        return item
    }

    @objc func popBackLeft() {
        navigationController?.popViewController(animated: true)
    }

    func setNavigationItemRight() -> UIBarButtonItem {
        let button = UIButton(frame: CGRect(x: 330, y: 58, width: 24, height: 24))
        button.setImage(UIImage(named: "plane"), for: .normal)
        button.addTarget(self, action: #selector(popBackRight), for: .touchUpInside)
        let item = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = item
        return item
    }

    @objc func popBackRight() {
        let activityController = UIActivityViewController(
            activityItems: [Constants.promocode],
            applicationActivities: nil
        )
        present(activityController, animated: true)
    }
}
