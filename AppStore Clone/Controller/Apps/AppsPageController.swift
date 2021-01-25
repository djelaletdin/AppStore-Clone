//
//  AppsController.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 30.12.2020.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout {
    
    let cellId = "id1212"
    let headerId = "headerid"
//    var editorsChoiceGames: AppGroup?
    var group = [AppGroup]()
    var socailApps = [SocialApp]()

    let activityIndicatorView: UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.color = .black
        aiv.startAnimating()
        aiv.backgroundColor = .white
        aiv.hidesWhenStopped = true
        return aiv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        view.addSubview(activityIndicatorView)
        activityIndicatorView.fillSuperview()
        fetchData()
    }
    
    fileprivate func fetchData(){

        let dispatchGroup = DispatchGroup()
        var groups = [AppGroup]()
        
        dispatchGroup.enter()
        Service.shared.fetchGames { (appGroup, error) in
            dispatchGroup.leave()
            if let error = error{
                print("error while fetching app groups", error)
                return
            }
            if let group = appGroup{
                groups.append(group)
            }
            DispatchQueue.main.async {
                    self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-paid/all/25/explicit.json") { (appGroup, error) in
            dispatchGroup.leave()
            if let error = error{
                print("error while fetching app groups", error)
                return
            }
            if let group = appGroup{
                groups.append(group)
            }
            DispatchQueue.main.async {
                    self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json") { (appGroup, error) in
            dispatchGroup.leave()
            if let error = error{
                print("error while fetching app groups", error)
                return
            }
            if let group = appGroup{
                groups.append(group)
            }
            DispatchQueue.main.async {
                    self.collectionView.reloadData()
            }
        }
        
        dispatchGroup.enter()
        Service.shared.fetchSocialApps { (apps, error) in
            dispatchGroup.leave()
                self.socailApps  = apps ?? []

            apps?.forEach({print("sfsdf"+$0.name)})
        }
        
        dispatchGroup.notify(queue: .main) {
            self.group.append(contentsOf: groups)
            self.collectionView.reloadData()
            self.activityIndicatorView.stopAnimating()
            
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeader
        header.appHeaderHorizontalController.socialApps = self.socailApps
        header.appHeaderHorizontalController.collectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return group.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        let app = group[indexPath.row]
        cell.titleLabel.text = app.feed.title
        cell.horizontalController.appGroup = app
        
        cell.horizontalController.didSelectHandler = { [weak self] feedResult in
            let destinationController  = AppDetailController(appId: feedResult.id)
            destinationController.navigationController?.title = feedResult.name
            self?.navigationController?.pushViewController(destinationController, animated: true)
        }
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300 )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}


