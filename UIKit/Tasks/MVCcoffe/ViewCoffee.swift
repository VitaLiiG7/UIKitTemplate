//
//  ViewCoffee.swift
//  Tasks
//
//  Created by Виталий Горбунов on 12.02.2024.
//

import UIKit
// Класс для отображения юайэлементов на экране заказа кофе
class ViewCoffee: UIView {
    
    // MARK: - Visual Components
    let orderButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 15, y: 717, width: 345, height: 53)
        button.backgroundColor = .order
        button.layer.cornerRadius = 12
        button.titleLabel?.text = "Заказать"
        button.tintColor = .white
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 18)
        return button
    }()
    
    let priceLabel: UILabel = {
       let label = UILabel()
        label.frame = CGRect(x: 15, y: 669, width: 345, height: 30)
        label.text = "Цѣна - 100 руб"
        label.font = UIFont(name: "Verdana-Bold", size: 18)
        label.textColor = .black
        return label
    }()
    
    
    let ingredientView: UIView = {
        let ingredient = UIView()
        ingredient.frame = CGRect(x: 195, y: 482, width: 165, height: 165)
//        ingredient.backgroundColor = UIColor(red: 247 / , green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        return ingredient
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
