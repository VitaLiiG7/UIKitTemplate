// ChequeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для выдачи чека
final class ChequeViewController: UIViewController {
    var label: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        label.text = ""
        label.textAlignment = .right
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textColor = .black
        return label
    }()
}
