// ChoosingSizeViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

// Экран размера обуви
final class ChoosingSizeViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let chooseSize = "Выберите размер"
        static let sizeFont = 16
        static let fontVerdana = "Verdana"
        static let startTopButton = 77
        static let startTopView = 103
        static let stepTop = 36
        static let size = "EU"
        static let price = "2250 р"
        static let blackHeels = "blackHeels"
        static let shoes = "Туфли женские"
    }

    // MARK: - Visual Components

    var basket: BasketViewController?
    private let brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.chooseSize
        label.font = UIFont(name: Constants.fontVerdana, size: CGFloat(Constants.sizeFont))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Private Properties

    private let size = [35, 36, 37, 38, 39]
    private var currentItem: InformationAboutShoes = .init(
        price: Constants.price,
        shoeImage: Constants.blackHeels,
        shoeName: Constants.shoes
    )

    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(.cross, for: .normal)
        button.addTarget(self, action: #selector(closeScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configure()
        addSize()
    }

    // MARK: - Private Methods

    private func setupView() {
        view.addSubview(brandLabel)
        view.addSubview(cancelButton)
        view.backgroundColor = .white
    }

    private func array(_ item: InformationAboutShoes) {
        currentItem = item
    }

    private func addSize() {
        var topButton = Constants.startTopButton
        var topView = Constants.startTopView
        for index in 0 ..< size.count {
            let sizeButton = UIButton()
            sizeButton.setTitle("\(size[index]) \(Constants.size)", for: .normal)
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

            topView += Constants.stepTop
            topButton += Constants.stepTop
        }
    }

    private func configure() {
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
        basket?.addCard(info: currentItem, size: size[tag])
    }

    @objc func closeScreen() {
        dismiss(animated: true)
    }
}
