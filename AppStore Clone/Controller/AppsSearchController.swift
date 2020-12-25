//
//  AppsSearchController.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 26.12.2020.
//

import UIKit


class AppsSearchController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white 
    }
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
