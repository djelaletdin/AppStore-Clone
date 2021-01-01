//
//  AppsGroupCell.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 31.12.2020.
//

import UIKit



class AppsGroupCell: UICollectionViewCell {
    
    let titleLabel = UILabel(text: "App Section", font: .boldSystemFont(ofSize: 30))
    let horizentalController = AppsHorizontalController()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .darkGray
        addSubview(titleLabel)
        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
        
        addSubview(horizentalController.view)
        horizentalController.view.anchor(top: titleLabel.bottomAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
 

