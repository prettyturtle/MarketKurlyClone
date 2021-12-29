//
//  HomeViewController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/26.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    private let data = ["이 상품 어때요?", "놓치면 후회할 가격", "인기 신상품 랭킹", "지금 가장 핫한 상품"]
    
    private let scrollView = UIScrollView()
    private let scrollContentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        return stackView
    }()
    
    private lazy var homeMainBannerView = HomeMainBannerView(frame: .zero)
    private lazy var homeContentView = HomeContentView(contentList: data[0])
    private let testView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        testView.backgroundColor = .red
    }
}

private extension HomeViewController {
    func setupLayout() {
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        scrollView.addSubview(scrollContentView)
        
        scrollContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        scrollContentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        [
            homeMainBannerView,
            homeContentView,
            testView
        ].forEach { stackView.addArrangedSubview($0) }
        
        homeMainBannerView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(homeMainBannerView.snp.width).multipliedBy(978.0/1080.0)
        }
        
        homeContentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(homeContentView.snp.width).multipliedBy(978.0/1080.0)
        }
        
        testView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1000.0)
        }
    }
}
