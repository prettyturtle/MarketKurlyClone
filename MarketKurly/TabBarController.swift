//
//  TabBarController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit

class TabBarController: UITabBarController {
    
    let homeViewController = HomeViewController()
    let categoryViewController = CategoryViewController()
    let searchViewController = UIViewController()
    let infoViewController = UIViewController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationItem()
        
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
            imageView.bounds = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 40.0)
            
            return imageView
        }()
        
        let logoTitleView: UIView = {
            let view = UIView()

            view.addSubview(logoImageView)

            return view
        }()
        
        navigationItem.titleView = logoTitleView
        
        // BarButtonItem
        let iconDeliverySettingBarButton: UIButton = {
            let button = UIButton()
            
            button.setImage(UIImage(named: "ico_delivery_setting"), for: .normal)
            button.frame = CGRect(x: 0.0, y: 0.0, width: 24.0, height: 24.0)
            button.tintColor = .white

            return button
        }()
        
        let iconCartBarButton: UIButton = {
            let button = UIButton()
            
            button.setImage(UIImage(named: "ico_cart_on"), for: .normal)
            button.frame = CGRect(x: 0.0, y: 0.0, width: 24.0, height: 24.0)
            button.tintColor = .white
            
            return button
        }()
        
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: iconCartBarButton),
            UIBarButtonItem(customView: iconDeliverySettingBarButton)
        ]
    }
}
