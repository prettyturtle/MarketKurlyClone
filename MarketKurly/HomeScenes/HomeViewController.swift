//
//  HomeViewController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/26.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeMainBannerView = HomeMainBannerView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationItem()
        setupLayout()
    }
}

private extension HomeViewController {
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
        navigationController?.navigationBar.backgroundColor = UIColor(red: 86 / 255, green: 11 / 255, blue: 123 / 255, alpha: 1)
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    func setupLayout() {
        [
            homeMainBannerView,
        ].forEach { view.addSubview($0) }
        
        homeMainBannerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(homeMainBannerView.snp.width).multipliedBy(978.0/1080.0)
        }
    }
}
