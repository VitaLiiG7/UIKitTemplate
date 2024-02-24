// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбраной категори товара в магазине'
final class CatalogViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let catalog = "Каталог"
        static let basket = "Корзина"
        static let profile = "Профиль"
        static let boots = "boots"
        static let sneakers = "sneakers"
    }

    // MARK: - Public Properties

    var linkToBasket: BasketViewController?

    // MARK: - Private Properties

    private let viewCatalog = ViewCatalog()
    private let shoeImage = [UIImage(named: Constants.boots), UIImage(named: Constants.sneakers)]
    private let shoeImageMap: [[UIImage]] = [
        [.womanShoes, .womanSandals, .brends, .slipper, .brownBag],
        [.boots, .sneakers, .brends, .shoes, .bag],
        [.colorfulSneakers, .redSneakers, .brends, .childrenRunningShoes, .pinkBackpack]
    ]

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        setupActions()
        setNavigationItem()
        settingImageTabBar()
    }

    // MARK: - Private Methods

    private func setupView() {
        view = viewCatalog
        title = Constants.catalog
        view.backgroundColor = .white
    }

    private func setupActions() {
        viewCatalog.segmentControll.addTarget(self, action: #selector(changingImageShoes), for: .valueChanged)
        viewCatalog.tapGestureRoas.addTarget(self, action: #selector(chooseShoes))
        viewCatalog.shoesView.addGestureRecognizer(viewCatalog.tapGestureRoas)
        viewCatalog.segmentControll.selectedSegmentIndex = 1
    }

    private func setNavigationItem() {
        let barcode = UIBarButtonItem(image: .barcode, style: .done, target: nil, action: nil)
        let camera = UIBarButtonItem(image: .camera, style: .done, target: nil, action: nil)
        navigationItem.rightBarButtonItems = [barcode, camera]
        navigationItem.rightBarButtonItems?[0].tintColor = .black
        navigationItem.rightBarButtonItems?[1].tintColor = .black
    }

    private func settingImageTabBar() {
        if let tabBarCatalog = tabBarController?.tabBar.items?[0] {
            tabBarCatalog.title = Constants.catalog
            tabBarCatalog.image = .catalogEmpty
            tabBarCatalog.selectedImage = .catalog
        }
        if let tabBarBasket = tabBarController?.tabBar.items?[1] {
            tabBarBasket.title = Constants.basket
            tabBarBasket.image = .basket
            tabBarBasket.selectedImage = .pinkBasket
        }
        if let tabBarProfile = tabBarController?.tabBar.items?[2] {
            tabBarProfile.title = Constants.profile
            tabBarProfile.image = .profileEmpty
            tabBarProfile.selectedImage = .profile
        }
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

        setupConstraintsLabel()
    }

    func setupConstraintsLabel() {
        viewCatalog.newProductsLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 22).isActive = true
        viewCatalog.newProductsLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 186).isActive = true
        viewCatalog.newProductsLabel.widthAnchor.constraint(equalToConstant: 160).isActive = true
        viewCatalog.newProductsLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true

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

    @objc private func changingImageShoes(target: UISegmentedControl) {
        if target == viewCatalog.segmentControll {
            let segmentIndex = target.selectedSegmentIndex
            let segmenDictionary = shoeImageMap[segmentIndex]
            viewCatalog.bootsImageView.image = segmenDictionary[0]
            viewCatalog.sneakersImageView.image = segmenDictionary[1]
            viewCatalog.brandImageView.image = segmenDictionary[2]
            viewCatalog.shoesImageView.image = segmenDictionary[3]
            viewCatalog.bagImageView.image = segmenDictionary[4]
        }
    }

    @objc private func chooseShoes() {
        let backButton = UIBarButtonItem()
        backButton.title = ""
        let choosingShoesViewController = ChoosingShoesViewController()
        guard let basketViewController = (
            navigationController?.tabBarController?
                .viewControllers?[1] as? UINavigationController
        )?.viewControllers[0] as? BasketViewController
        else { return }
        choosingShoesViewController.transitionHandler = basketViewController
//        choosingShoesViewController.choosinLink = linkToBasket
        navigationItem.backBarButtonItem = backButton
        navigationController?.pushViewController(choosingShoesViewController, animated: true)
    }
}
