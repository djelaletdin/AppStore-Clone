//
//  AppRowCell.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 31.12.2020.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    let imageView = UIImageView(cornerRadius: 8)
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyName = UILabel(text: "Company name", font: .systemFont(ofSize: 10))
    let getButton = UIButton(title: "GET")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            backgroundColor = .green
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        imageView.backgroundColor = .purple
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainHeight(constant: 32)
        getButton.constrainWidth(constant: 80)
        getButton.layer.cornerRadius = 16
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel, getButton])
        addSubview(stackView)
        stackView.alignment = .center
        stackView.fillSuperview()
        
        }
    required init?(coder aDecoder: NSCoder){
        fatalError("init coder error approwcell")
    }
}

