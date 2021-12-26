//
//  HomeMainBannerCollectionViewCell.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit
import SnapKit

class HomeMainBannerCollectionViewCell: UICollectionViewCell {
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    func setupView(index: Int) {
        setupLayout()
        
        bannerImageView.image = UIImage(named: "bannerImage\(index)")
    }
}

private extension HomeMainBannerCollectionViewCell {
    func setupLayout() {
        addSubview(bannerImageView)
        
        bannerImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
