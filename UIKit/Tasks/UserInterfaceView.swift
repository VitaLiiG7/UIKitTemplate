// UserInterfaceView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Kласс для отображения юай элементов
final class UserInterfaceView: UIView {
    lazy var startButton: UIButton = {
        let startButton = UIButton()
        startButton.frame = CGRect(x: 20, y: 406, width: 335, height: 44)
        startButton.layer.cornerRadius = 12
        startButton.backgroundColor = UIColor(
            _colorLiteralRed: 76 / 255.0,
            green: 216 / 255.0,
            blue: 102 / 255.0,
            alpha: 1
        )
        startButton.setTitle("Начать", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Verdana", size: 16)
        return startButton
    }()

    let leadWordLabel: UILabel = {
        let leadWordLabel = UILabel()
        leadWordLabel.frame = CGRect(x: 50, y: 106, width: 275, height: 57)
        leadWordLabel.text = "Вы ввели слово"
        leadWordLabel.font = .boldSystemFont(ofSize: 16)
        leadWordLabel.textColor = .black
        leadWordLabel.textAlignment = .center
        return leadWordLabel
    }()

    let originalWordLabel: UILabel = {
        let originalWordLabel = UILabel()
        originalWordLabel.frame = CGRect(x: 50, y: 163, width: 275, height: 57)
        originalWordLabel.textColor = .systemGray2
        originalWordLabel.font = .italicSystemFont(ofSize: 16)
        originalWordLabel.textAlignment = .center
        return originalWordLabel
    }()

    let resultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.frame = CGRect(x: 50, y: 282, width: 275, height: 57)
        resultLabel.text = "А вот что получится, если читать справо налево"
        resultLabel.font = .boldSystemFont(ofSize: 16)
        resultLabel.numberOfLines = 0
        resultLabel.textColor = .black
        resultLabel.textAlignment = .center
        return resultLabel
    }()

    let invertedWordLabel: UILabel = {
        let invertedWordLabel = UILabel()
        invertedWordLabel.frame = CGRect(x: 50, y: 339, width: 275, height: 57)
        invertedWordLabel.textColor = .systemGray3
        invertedWordLabel.font = .italicSystemFont(ofSize: 16)
        invertedWordLabel.textAlignment = .center
        return invertedWordLabel
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func setView() {
        backgroundColor = .white
        addSubview(startButton)
        addSubview(leadWordLabel)
        addSubview(originalWordLabel)
        addSubview(resultLabel)
        addSubview(invertedWordLabel)
    }
}
