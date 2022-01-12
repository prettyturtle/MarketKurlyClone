//
//  TabBarController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeViewController = UINavigationController(rootViewController: HomeViewController())
    let categoryViewController = UINavigationController(rootViewController: CategoryViewController())
    let searchViewController = UIViewController()
    let infoViewController = UINavigationController(rootViewController: MyKurlyViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tabBar.backgroundColor = .systemBackground
        
        viewControllers = [
            homeViewController,
            categoryViewController,
            searchViewController,
            infoViewController
        ]
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        categoryViewController.tabBarItem = UITabBarItem(
            title: "카테고리",
            image: UIImage(systemName: "line.3.horizontal"),
            selectedImage: UIImage(systemName: "line.3.horizontal")
        )
        searchViewController.tabBarItem = UITabBarItem(
            title: "검색",
            image: UIImage(systemName: "magnifyingglass"),
            selectedImage: UIImage(systemName: "magnifyingglass")
        )
        infoViewController.tabBarItem = UITabBarItem(
            title: "마이컬리",
            image: UIImage(systemName: "person"),
            selectedImage: UIImage(systemName: "person.fill")
        )
        
        view.tintColor = .mainColor
    }
}
