// ViewCatalog.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Класс для отображения интерфейса на экране каталог
final class ViewCatalog: UIView {
    // MARK: - Constants

    enum Constants {
        static let women = "Женщинам"
        static let men = "Мужчинам"
        static let children = "Детям"
        static let new = "Новинки"
        static let productsSize = 14
        static let fontVerdanaBold = "Verdana-Bold"
        static let sale = "Распродажа"
        static let brands = "Бренды"
        static let shoes = "Обувь"
        static let bags = "Сумки"
    }

    // MARK: - Visual Components

    let bootsImageView = CustomRoundShadowImageView(image: .boots)
    let sneakersImageView = CustomRoundShadowImageView(image: .sneakers)
    let brandImageView = CustomRoundShadowImageView(image: .brends)
    let shoesImageView = CustomRoundShadowImageView(image: .shoes)
    let bagImageView = CustomRoundShadowImageView(image: .bag)
    let tapGestureRoas = UITapGestureRecognizer()

    let newProductsLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.new
        label.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.productsSize))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let saleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = Constants.sale
        label.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.productsSize))
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let brandLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.brands
        label.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.productsSize))
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let shoesLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.shoes
        label.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.productsSize))
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let bagLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = Constants.bags
        label.font = UIFont(name: Constants.fontVerdanaBold, size: CGFloat(Constants.productsSize))
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let segmentControll: UISegmentedControl = {
        let segment = UISegmentedControl(items: [Constants.women, Constants.men, Constants.children])
        segment.translatesAutoresizingMaskIntoConstraints = false
        return segment

    }()

    let brandsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .colorView
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let shoesView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .colorView
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let bagsView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = .colorView
        view.layer.shadowOpacity = 0.5
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - Private Methods

    private func setupView() {
        [
            bootsImageView,
            sneakersImageView,
            segmentControll,
            newProductsLabel,
            saleLabel,
            brandsView,
            shoesView,
            bagsView,
            brandImageView,
            shoesImageView,
            bagImageView,
            brandLabel,
            shoesLabel,
            bagLabel
        ].forEach { addSubview($0) }
    }
}
