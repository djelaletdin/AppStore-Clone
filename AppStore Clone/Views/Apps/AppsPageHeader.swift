//
//  AppsPageHeader.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 01.01.2021.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
     
    let appHeaderHorizontalControllers = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        addSubview(appHeaderHorizontalControllers.view)
        appHeaderHorizontalControllers.view.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
