// StackViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Вью Контроллер
final class StackViewController: UIViewController {
    // MARK: - Visual Components

    private let redView = UIView()
    private let yellowView = UIView()
    private let greenView = UIView()
    private let stackView = UIStackView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    private func setupUI() {
        redView.backgroundColor = .red
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
    }
}
