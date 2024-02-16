// ChoosingSizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol SizeDelegate: AnyObject {
    func transferShoeSize(size: Int)
}

// Экран для выбора размера обуви
class ChoosingSizeViewController: UIViewController {
    enum Constants {
        static let chooseSize = "Выберите размер"
        static let sizeFont = 16
        static let fontVerdana = "Verdana"
    }

    let size = [35, 36, 37, 38, 39]
    weak var delegate: SizeDelegate?

    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(.cross, for: .normal)
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.chooseSize
        label.font = UIFont(name: Constants.fontVerdana, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configure()
        addSize()
    }

    // MARK: - Private Methods

    func setupView() {
        view.addSubview(brandLabel)
        view.addSubview(cancelButton)
        view.backgroundColor = .white
    }

    func addSize() {
        var topButton = 77
        var topView = 103
        for index in 0 ..< size.count {
            let sizeButton = UIButton()
            sizeButton.setTitle("\(size[index]) EU", for: .normal)
            sizeButton.setTitleColor(.black, for: .normal)
            sizeButton.contentHorizontalAlignment = .left
            sizeButton.tag = index
            sizeButton.addTarget(self, action: #selector(chooseShoeSize), for: .touchUpInside)
            let sizeView = UIView()
            sizeView.backgroundColor = .systemGray
            sizeView.translatesAutoresizingMaskIntoConstraints = false
            sizeButton.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(sizeButton)
            view.addSubview(sizeView)
            sizeView.widthAnchor.constraint(equalToConstant: 335).isActive = true
            sizeView.heightAnchor.constraint(equalToConstant: 1).isActive = true
            sizeView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topView)).isActive = true
            sizeView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

            sizeButton.widthAnchor.constraint(equalToConstant: 278).isActive = true
            sizeButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
            sizeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topButton)).isActive = true
            sizeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true

            topView += 36
            topButton += 36
        }
    }

    func configure() {
        brandLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 11).isActive = true
        brandLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 87).isActive = true
        brandLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        brandLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true

        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 21).isActive = true
        cancelButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    @objc func chooseShoeSize(sender: UIButton) {
        let tag = sender.tag
        delegate?.transferShoeSize(size: size[tag])
    }

    @objc func closeScreen() {
        dismiss(animated: true)
    }
}
