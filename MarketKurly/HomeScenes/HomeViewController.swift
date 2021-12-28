//
//  HomeViewController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/26.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var homeMainBannerView = HomeMainBannerView(frame: .zero)
    private lazy var homeContentView = HomeContentView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

private extension HomeViewController {
    func setupLayout() {
        [
            homeMainBannerView,
            homeContentView
        ].forEach { view.addSubview($0) }
        
        homeMainBannerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(homeMainBannerView.snp.width).multipliedBy(978.0/1080.0)
        }
        
        homeContentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(homeMainBannerView.snp.bottom)
            make.height.equalTo(homeMainBannerView.snp.width).multipliedBy(978.0/1080.0)        }
    }
}
