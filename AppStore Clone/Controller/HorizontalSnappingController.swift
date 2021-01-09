//
//  HorizontalSnappingController.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 09.01.2021.
//

import UIKit

class HorizontalSnappingController: UICollectionViewController {
    init(){
        let layout = BetterSnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnappingLayout: UICollectionViewFlowLayout {
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        return .zero
    }
}
