// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Вью Контроллер
final class StackViewController: UIViewController {
    // MARK: - Visual Components

//    private let redView = UIView()
//    private let yellowView = UIView()
//    private let greenView = UIView()
//    private let grayView = UIView()
//    private var stackView = UIStackView()

    private let redView = MyView()
    private let yellowView = MyView()
    private let greenView = MyView()
    private let grayView = UIView()
    private var stackView = UIStackView()

    // drorect

    // MARK: - Life Cycle

//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        greenView.layer.cornerRadius = greenView.bounds.height / 2
//        yellowView.layer.cornerRadius = greenView.bounds.height / 2
//        redView.layer.cornerRadius = greenView.bounds.height / 2
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupStackViewConstraints()
        setupUIGrayViewConstraints()
    }

    // MARK: - Private Methods

    private func setupUI() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        grayView.backgroundColor = .gray
        view.addSubview(grayView)
        stackView = UIStackView(arrangedSubviews: [redView, yellowView, greenView])
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        grayView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }

    private func setupStackViewConstraints() {
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.heightAnchor.constraint(lessThanOrEqualToConstant: 376).isActive = true
        let height = stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65)
        height.priority = .defaultLow
        height.isActive = true
        stackView.widthAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 0.33).isActive = true
    }

    private func setupUIGrayViewConstraints() {
        grayView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: -15).isActive = true
        grayView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: -25).isActive = true
        grayView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 25).isActive = true
        grayView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 15).isActive = true
    }
}
