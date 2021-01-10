//
//  PreviewScreenshotController.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 10.01.2021.
//

import UIKit
import SDWebImage

class PreviewScreenshotController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    var cellId = "cellId"
    
    var app: Result?{
        didSet{
            collectionView.reloadData()
        }
    }
    
    class ScreenshotCell: UICollectionViewCell {
        let imageView: UIImageView = {
            let iv = UIImageView(cornerRadius: 8)
            iv.backgroundColor = .green
            return iv
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            addSubview(imageView)
            imageView.fillSuperview()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(ScreenshotCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return app?.screenshotUrls.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ScreenshotCell
        let screenshotUrl = self.app?.screenshotUrls[indexPath.row]
        cell.imageView.sd_setImage(with: URL(string: screenshotUrl ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 250, height: view.frame.height )
    }
}
