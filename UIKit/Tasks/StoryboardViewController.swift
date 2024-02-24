// StoryboardViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Вью Контроллер
final class StoryboardViewController: UIViewController {
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        greenView.layer.cornerRadius = greenView.bounds.height / 2
        yellowView.layer.cornerRadius = greenView.bounds.height / 2
        redView.layer.cornerRadius = greenView.bounds.height / 2
    }
}
