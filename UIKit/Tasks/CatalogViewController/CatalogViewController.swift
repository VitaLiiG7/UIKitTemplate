// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран Каталог товара
final class CatalogViewController: UIViewController {
    enum Constants {
        static let catalog = "Каталог"
        static let basket = "Корзина"
        static let profile = "Профиль"
    }

    var viewCatalog = ViewCatalog()
    private let shoeImage = [UIImage(named: "boots"), UIImage(named: "sneakers")]
    private let shoeImageMap: [Int: [UIImage]] = [
        0: [.womanShoes, .womanSandals, .brends, .slipper, .brownBag],
        1: [.colorfulSneakers, .redSneakers, .brends, .childrenRunningShoes, .pinkBackpack],
        2: [.boots, .sneakers, .brends, .shoes, .bag],
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view = viewCatalog
        setupConstraints()
        setupActions()
        setNavigationItem()
        view.backgroundColor = .white
        settingImageTabBar()
    }

    // MARK: - Private Methods

    private func setupActions() {
        viewCatalog.segmentControll.addTarget(self, action: #selector(changingImage), for: .valueChanged)
        viewCatalog.tapGestureRoas.addTarget(self, action: #selector(chooseShoes))
        viewCatalog.shoesView.addGestureRecognizer(viewCatalog.tapGestureRoas)
        viewCatalog.segmentControll.selectedSegmentIndex = 1
        title = "Каталог"
    }

    func setNavigationItem() {
        let item = UIBarButtonItem(image: .barcode, style: .done, target: nil, action: nil)
        let item2 = UIBarButtonItem(image: .camera, style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [item, item2]
        navigationItem.rightBarButtonItems?[0].tintColor = .black
        navigationItem.rightBarButtonItems?[1].tintColor = .black
    }

    func settingImageTabBar() {
        if let tabBarItem1 = tabBarController?.tabBar.items?[0] {
            tabBarItem1.title = Constants.catalog
            tabBarItem1.image = .catalogEmpty
            tabBarItem1.selectedImage = .catalog
        }
        if let tabBarItem2 = tabBarController?.tabBar.items?[1] {
            tabBarItem2.title = Constants.basket
            tabBarItem2.image = .basket
            tabBarItem2.selectedImage = .pinkBasket
        }
        if let tabBarItem3 = tabBarController?.tabBar.items?[2] {
            tabBarItem3.title = Constants.profile
            tabBarItem3.image = .profileEmpty
            tabBarItem3.selectedImage = .profile
        }
    }

    @objc private func changingImage(target: UISegmentedControl) {
        if target == viewCatalog.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            let segmenDictionary = shoeImageMap[segmentIndex]
            viewCatalog.bootsImageView.image = segmenDictionary?[0]
            viewCatalog.sneakersImageView.image = segmenDictionary?[1]
            viewCatalog.brandImageView.image = segmenDictionary?[2]
            viewCatalog.shoesImageView.image = segmenDictionary?[3]
            viewCatalog.bagImageView.image = segmenDictionary?[4]
        }
    }

    @objc private func chooseShoes() {
        navigationController?.pushViewController(ChoosingShoesViewController(), animated: true)
    }

    private func setupConstraints() {
        viewCatalog.bootsImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewCatalog.bootsImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        viewCatalog.bootsImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        viewCatalog.bootsImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        viewCatalog.sneakersImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 195).isActive = true
        viewCatalog.sneakersImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        viewCatalog.sneakersImageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        viewCatalog.sneakersImageView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        viewCatalog.segmentControll.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        viewCatalog.segmentControll.topAnchor.constraint(equalTo: view.topAnchor, constant: 122).isActive = true
        viewCatalog.segmentControll.widthAnchor.constraint(equalToConstant: 345).isActive = true
        viewCatalog.segmentControll.heightAnchor.constraint(equalToConstant: 44).isActive = true

        viewCatalog.newProductsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22).isActive = true
        viewCatalog.newProductsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        viewCatalog.newProductsLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        viewCatalog.newProductsLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        viewCatalog.brandsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewCatalog.brandsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 326).isActive = true
        viewCatalog.brandsView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        viewCatalog.brandsView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        viewCatalog.shoesView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewCatalog.shoesView.topAnchor.constraint(equalTo: view.topAnchor, constant: 426).isActive = true
        viewCatalog.shoesView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        viewCatalog.shoesView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        viewCatalog.bagsView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        viewCatalog.bagsView.topAnchor.constraint(equalTo: view.topAnchor, constant: 526).isActive = true
        viewCatalog.bagsView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        viewCatalog.bagsView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        viewCatalog.brandImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 256).isActive = true
        viewCatalog.brandImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 326).isActive = true
        viewCatalog.brandImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        viewCatalog.brandImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        viewCatalog.shoesImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 257).isActive = true
        viewCatalog.shoesImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 426).isActive = true
        viewCatalog.shoesImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        viewCatalog.shoesImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        viewCatalog.bagImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 256).isActive = true
        viewCatalog.bagImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 526).isActive = true
        viewCatalog.bagImageView.widthAnchor.constraint(equalToConstant: 99).isActive = true
        viewCatalog.bagImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true

        viewCatalog.brandLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        viewCatalog.brandLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 357).isActive = true
        viewCatalog.brandLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        viewCatalog.brandLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        viewCatalog.saleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 195).isActive = true
        viewCatalog.saleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 289).isActive = true
        viewCatalog.saleLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        viewCatalog.saleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        viewCatalog.shoesLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        viewCatalog.shoesLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 457).isActive = true
        viewCatalog.shoesLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        viewCatalog.shoesLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

        viewCatalog.bagLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        viewCatalog.bagLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 557).isActive = true
        viewCatalog.bagLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        viewCatalog.bagLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
}
