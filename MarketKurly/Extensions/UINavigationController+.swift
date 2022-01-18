//
//  UINavigationController+.swift
//  MarketKurly
//
//  Created by yc on 2022/01/12.
//

import UIKit

enum NavigationType {
    case image
    case text
}

extension UINavigationController {
    /// Setting NavigationBar
    func setupNavigationItem(
        _ target: UIViewController,
        titleType: NavigationType,
        image: UIImage?,
        text: String?
    ) {
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = .mainColor
        navigationBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        target.navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        target.navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        
        // logo
        switch titleType {
        case .image:
            guard let logoImage = image else { return }
            
            let logoImageView: UIImageView = {
                let imageView = UIImageView()
                
                imageView.image = logoImage
                imageView.clipsToBounds = true
                imageView.contentMode = .scaleAspectFit
                imageView.bounds = CGRect(x: 0.0, y: 0.0, width: 60.0, height: 50.0)
                
                return imageView
            }()
            
            let logoTitleView: UIView = {
                let view = UIView()
                
                view.addSubview(logoImageView)
                
                return view
            }()
            
            target.navigationItem.titleView = logoTitleView
            
        case .text:
            guard let text = text else { return }
            target.navigationItem.title = text
        }
        
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
        
        target.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: iconCartBarButton),
            UIBarButtonItem(customView: iconDeliverySettingBarButton)
        ]
    }
    
    func setupPresentedNavigationItem(
        _ target: UIViewController,
        titleOfNavigationItem: String?,
        leftBarButtonAction: Selector?
    ) {
        guard let title = titleOfNavigationItem else { return }
        
        target.navigationItem.title = title
        target.navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: target,
            action: leftBarButtonAction
        )
        target.navigationItem.leftBarButtonItem?.tintColor = .label
    }
}
