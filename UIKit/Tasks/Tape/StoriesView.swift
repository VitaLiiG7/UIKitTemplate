//
//  StoriesView.swift
//  Tasks
//
//  Created by Виталий Горбунов on 19.02.2024.
//

import UIKit

class StoriesView: UIView {
    
    enum Constants {
        static let verdana = "Verdana"
    }
    
    // MARK: - Private Properties
    private let storiesImageView: UIImageView = {
        let image = UIImageView()
        image.image = .womanInField
        image.layer.cornerRadius = 60
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.verdana, size: 8)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(storiesImageView)
        addSubview(usernameLabel)
        
    }
}
