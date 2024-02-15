// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран профиль пользователя с личными данными ( делает коллега )
class ProfileViewController: UIViewController {
    
    //MARK: - Constants
    enum Constants {
        static let minSize = CGFloat(14)
        static let font = "Verdana"
        static let boldFont = "Verdana-Bold"
        static let mediumSize = CGFloat(16)
    }
    // MARK: - Visual Components

    private let gest = UITapGestureRecognizer()
    private let feedBackImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .feedBackIcon
        return image
    }()

    private let feedBackLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Обратная связь"
        label.font = UIFont(name: Constants.font, size: Constants.mediumSize)
        return label
    }()

    private let inviteFriendLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Приведи друга"
        label.font = UIFont(name: Constants.font, size: Constants.mediumSize)
        return label
    }()

    private let inviteFriendIconImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .inviteIcon
        return image
    }()

    private let myDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Мои данные"
        label.font = UIFont(name: Constants.font, size: Constants.mediumSize)
        return label
    }()

    private let iconUserData: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .iconUserData
        return image
    }()

    private let userDataLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Личные данные"
        label.font = UIFont(name: Constants.boldFont, size: Constants.mediumSize)
        return label
    }()

    private let infoImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .info
        return image
    }()

    private let qrCodeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .qrCode
        return image
    }()

    private let numberOfCardLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1000 0001 0102"
        label.textColor = .white
        label.font = UIFont(name: Constants.font, size: Constants.minSize)
        return label
    }()

    private let saleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "15%"
        label.textColor = .white
        label.font = UIFont(name: Constants.boldFont, size: Constants.mediumSize)
        return label
    }()

    private let logoCardImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .logoCard
        return image
    }()

    private let profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Профиль"
        label.font = UIFont(name: Constants.boldFont, size: Constants.mediumSize)
        return label
    }()

    private let blackCardImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = .blackCard
        return image
    }()

    // MARK: - Private methods

    private func setupFeedBackLabel() {
        feedBackLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        feedBackLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        feedBackLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 78).isActive = true
        feedBackLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 435).isActive = true
    }

    private func setupFeedBackImageView() {
        feedBackImageView.widthAnchor.constraint(equalToConstant: 18).isActive = true
        feedBackImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        feedBackImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48).isActive = true
        feedBackImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 440).isActive = true
    }

    private func setupInviteFriendLabel() {
        inviteFriendLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        inviteFriendLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        inviteFriendLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 78).isActive = true
        inviteFriendLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 395).isActive = true
    }

    private func setupInviteFriendIcon() {
        inviteFriendIconImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        inviteFriendIconImageView.heightAnchor.constraint(equalToConstant: 18).isActive = true
        inviteFriendIconImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48).isActive = true
        inviteFriendIconImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
    }

    private func setupMyDataLabel() {
        myDataLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        myDataLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        myDataLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 78).isActive = true
        myDataLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 357).isActive = true
    }

    private func setupIconUserDate() {
        iconUserData.widthAnchor.constraint(equalToConstant: 18).isActive = true
        iconUserData.heightAnchor.constraint(equalToConstant: 20).isActive = true
        iconUserData.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48).isActive = true
        iconUserData.topAnchor.constraint(equalTo: view.topAnchor, constant: 360).isActive = true
    }

    private func setupUserDataLabel() {
        userDataLabel.widthAnchor.constraint(equalToConstant: 163).isActive = true
        userDataLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        userDataLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        userDataLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        gest.addTarget(self, action: #selector(tranzitNavigation))
        myDataLabel.addGestureRecognizer(gest)
    }

    private func setupInfoImageView() {
        infoImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        infoImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        infoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 310).isActive = true
        infoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
    }

    private func setupQrCodeImageView() {
        qrCodeImageView.widthAnchor.constraint(equalToConstant: 15).isActive = true
        qrCodeImageView.heightAnchor.constraint(equalToConstant: 15).isActive = true
        qrCodeImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 310).isActive = true
        qrCodeImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
    }

    private func setupNumberOfCardLabel() {
        numberOfCardLabel.widthAnchor.constraint(equalToConstant: 118).isActive = true
        numberOfCardLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        numberOfCardLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        numberOfCardLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 260).isActive = true
    }

    private func setupSaleLabel() {
        saleLabel.widthAnchor.constraint(equalToConstant: 44).isActive = true
        saleLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
        saleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 45).isActive = true
        saleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
    }

    private func setupBlackCard() {
        blackCardImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        blackCardImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        blackCardImageView.widthAnchor.constraint(equalToConstant: 335).isActive = true
        blackCardImageView.heightAnchor.constraint(equalToConstant: 180).isActive = true
    }

    private func setupLogoCard() {
        logoCardImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        logoCardImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        logoCardImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
        logoCardImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 140).isActive = true
    }

    private func setupProfiLabel() {
        profileLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 145).isActive = true
        profileLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        profileLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
        profileLabel.widthAnchor.constraint(equalToConstant: 115).isActive = true
    }
    @objc private func tranzitNavigation() {
        
    }

    private func setupUI() {
        view.addSubview(profileLabel)
        setupProfiLabel()
        view.addSubview(blackCardImageView)
        setupBlackCard()
        view.addSubview(logoCardImageView)
        setupLogoCard()
        view.addSubview(saleLabel)
        setupSaleLabel()
        view.addSubview(numberOfCardLabel)
        setupNumberOfCardLabel()
        view.addSubview(qrCodeImageView)
        setupQrCodeImageView()
        view.addSubview(infoImageView)
        setupInfoImageView()
        view.addSubview(userDataLabel)
        setupUserDataLabel()
        view.addSubview(iconUserData)
        setupIconUserDate()
        view.addSubview(myDataLabel)
        setupMyDataLabel()
        view.addSubview(inviteFriendIconImageView)
        setupInviteFriendIcon()
        view.addSubview(inviteFriendLabel)
        setupInviteFriendLabel()
        view.addSubview(feedBackImageView)
        setupFeedBackImageView()
        view.addSubview(feedBackLabel)
        setupFeedBackLabel()
    }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
}


