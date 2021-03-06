// 
//  BaseTabBarController.swift
//  AppStore Clone
//
//  Created by Didar Jelaletdinov on 26.12.2020.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        viewControllers = [
            createNavController(viewController: TodayController(), title: "TODAY", image: #imageLiteral(resourceName: "today_icon")),
            createNavController(viewController: AppsPageController(), title: "APPS", image: #imageLiteral(resourceName: "apps")),
            createNavController(viewController: AppsSearchController(), title: "SEARCH", image: #imageLiteral(resourceName: "search")),            
            
        ]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, image: UIImage)-> UIViewController{
        
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title
        
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        return navController
    }
}
