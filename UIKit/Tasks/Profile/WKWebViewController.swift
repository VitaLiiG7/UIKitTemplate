// WKWebViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit
import WebKit

///  Экран для отображения сайта spacex
final class WKWebViewController: UIViewController {
    // MARK: - Visual Components

    private lazy var cancelButton = {
        let button = UIButton()
        button.setImage(.cross, for: .normal)
        button.addTarget(self, action: #selector(cancelButtom), for: .touchUpInside)
        return button
    }()

    private let webView = WKWebView()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupButtonConstraints()
        setupwebViewConstraints()
        loadRequest()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(webView)
        view.addSubview(cancelButton)
        webView.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupButtonConstraints() {
        cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 28).isActive = true
        cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
        cancelButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }

    private func setupwebViewConstraints() {
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func loadRequest() {
        guard let url = URL(string: "https://www.spacex.com/vehicles/starship/") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }

    @objc private func cancelButtom() {
        dismiss(animated: true)
    }
}
