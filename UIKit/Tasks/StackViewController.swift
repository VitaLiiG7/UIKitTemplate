// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран создания сфетофора с помощью StckView
final class StackViewController: UIViewController {
    // MARK: - Visual Components

    private let redView = CustomView()
    private let yellowView = CustomView()
    private let greenView = CustomView()
    private let grayView = UIView()
    private var stackView = UIStackView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureStackView()
        configureUI()
        addSubview()
        setupStackViewConstraints()
        setupGrayViewConstraints()
    }

    // MARK: - Private Methods

    private func addSubview() {
        view.addSubview(grayView)
        view.addSubview(stackView)
    }

    private func configureUI() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        grayView.backgroundColor = .gray
    }

    private func configureStackView() {
        stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }

    private func setupStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 376).isActive = true
        let height = stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65)
        height.priority = .defaultLow
        height.isActive = true
        stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.33).isActive = true
    }

    private func setupGrayViewConstraints() {
        grayView.translatesAutoresizingMaskIntoConstraints = false
        grayView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -15).isActive = true
        grayView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -25).isActive = true
        grayView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 25).isActive = true
        grayView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15).isActive = true
    }
}
