// NSLayoutAnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Вью Контроллер
final class NSLayoutAnchorViewController: UIViewController {
    // MARK: - Visual Components

    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewAnchor()
    }

    private func setupUI() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green

        for item in [redView, yellowView, greenView] {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func setupViewAnchor() {
        yellowView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 8).isActive = true
        yellowView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        yellowView.widthAnchor.constraint(equalToConstant: 44).isActive = true

//        redView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
//        redView.widthAnchor.constraint(lessThanOrEqualToConstant: yellowView.widthAnchor).isActive = true
    }
}
