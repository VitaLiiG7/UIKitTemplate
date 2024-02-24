// NSLayoutAnchorViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Вью Контроллер
final class NSLayoutAnchorViewController: UIViewController {
    // MARK: - Visual Components

    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let grayView = UIView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayoutAnchor()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        redView.layer.cornerRadius = redView.bounds.height / 2
        yellowView.layer.cornerRadius = yellowView.bounds.height / 2
        greenView.layer.cornerRadius = greenView.bounds.height / 2
    }

    private func setupLayoutAnchor() {
        setupyellowViewAnchor()
        setupRedViewAnchor()
        setupGreenViewAnchor()
        setupGrayViewAnchor()
    }

    private func setupUI() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        grayView.backgroundColor = .gray

        for item in [grayView, redView, yellowView, greenView] {
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    private func setupyellowViewAnchor() {
        yellowView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        yellowView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        yellowView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 8).isActive = true
        yellowView.heightAnchor.constraint(lessThanOrEqualToConstant: 110).isActive = true
        let height = yellowView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25)
        height.priority = .defaultLow
        height.isActive = true
        yellowView.widthAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    private func setupRedViewAnchor() {
        redView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        redView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
        redView.topAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
            .isActive = true
    }

    private func setupGreenViewAnchor() {
        greenView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor, constant: 8).isActive = true
        greenView.widthAnchor.constraint(equalTo: yellowView.widthAnchor).isActive = true
        greenView.heightAnchor.constraint(equalTo: yellowView.heightAnchor).isActive = true
    }

    private func setupGrayViewAnchor() {
        grayView.topAnchor.constraint(equalTo: redView.topAnchor, constant: -15).isActive = true
        grayView.leadingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -25).isActive = true
        grayView.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: 25).isActive = true
        grayView.bottomAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 15).isActive = true
    }
}
