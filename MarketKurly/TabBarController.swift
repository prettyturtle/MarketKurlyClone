//
//  TabBarController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeViewController = UINavigationController(rootViewController: HomeViewController())
    let recommendViewController = UINavigationController(rootViewController: UIViewController())
    let categoryViewController = UINavigationController(rootViewController: UIViewController())
    let searchViewController = UINavigationController(rootViewController: UIViewController())
    let infoViewController = UINavigationController(rootViewController: UIViewController())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            homeViewController,
            recommendViewController,
            categoryViewController,
            searchViewController,
            infoViewController
        ]
        
        homeViewController.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        recommendViewController.tabBarItem = UITabBarItem(
            title: "추천",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
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
        
        view.tintColor = UIColor(red: 86 / 255, green: 11 / 255, blue: 123 / 255, alpha: 1)
    }
}
