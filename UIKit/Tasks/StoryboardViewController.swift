// StoryboardViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран создание светофора на сториборде
final class StoryboardViewController: UIViewController {
    // MARK: - IBOutlets

    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!

    // MARK: - Life Cycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenView.layer.cornerRadius = greenView.bounds.height / 2
        yellowView.layer.cornerRadius = greenView.bounds.height / 2
        redView.layer.cornerRadius = greenView.bounds.height / 2
    }
}
