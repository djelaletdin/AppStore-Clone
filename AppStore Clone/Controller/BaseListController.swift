//
//  BaseListController.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 30.12.2020.
//

import UIKit

class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
