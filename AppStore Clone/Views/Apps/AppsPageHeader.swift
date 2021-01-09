//
//  AppsPageHeader.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 01.01.2021.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
     
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    var socialApps = [SocialApp]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        appHeaderHorizontalController.collectionView.reloadData()
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
