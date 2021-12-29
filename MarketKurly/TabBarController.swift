//
//  TabBarController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeViewController = HomeViewController()
    let recommendViewController = UIViewController()
    let categoryViewController = UIViewController()
    let searchViewController = UIViewController()
    let infoViewController = UIViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        
        tabBar.backgroundColor = .systemBackground
        
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
        
        view.tintColor = UIColor(named: "kurlyColor")
    }
}

private extension TabBarController {
    func setupNavigationItem() {
        // logo
        let logoImage = UIImage(named: "kurly_logo")
        
        let logoImageView: UIImageView = {
            let imageView = UIImageView()
            
            imageView.image = logoImage
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFit
            
            return imageView
        }()
        
        navigationItem.titleView = logoImageView
        
        // BarButtonItem
        let iconDeliverySetting = UIBarButtonItem(
            image: UIImage(named: "ico_delivery_setting"),
            style: .plain,
            target: self,
            action: nil
        )
        let iconCart = UIBarButtonItem(
            image: UIImage(named: "ico_cart_on"),
            style: .plain,
            target: self,
            action: nil
        )

        navigationItem.rightBarButtonItems = [iconCart, iconDeliverySetting]
    }
}
