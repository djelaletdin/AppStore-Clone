//
//  AppDetailController.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 09.01.2021.
//

import UIKit

class AppDetailController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    var cellId = "DetailCellId"
    var previewId  = "previewId"
    var reviewId = "reviewId"
    
    var appId: String!{
        didSet{
            print(appId ?? "")
            let urlString = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            print(urlString)
            Service.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    var app: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewId)
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewId)
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .white
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        } else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewId, for: indexPath) as! PreviewCell
            cell.horizontalController.app = app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewId, for: indexPath) as! ReviewRowCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height: CGFloat = 280
        
        if indexPath.row == 0{
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 1000))
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            height = estimatedSize.height
        } else if indexPath.row == 1{
            height = 500
        } else {
            height = 280
        }
        
        return .init(width: view.frame.width, height: height)

    }
}
