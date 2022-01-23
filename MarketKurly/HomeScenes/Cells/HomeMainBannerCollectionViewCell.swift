//
//  HomeMainBannerCollectionViewCell.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit
import SnapKit
import Kingfisher

class HomeMainBannerCollectionViewCell: UICollectionViewCell {
    private lazy var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    func setupView(banner: Banner) {
        setupLayout()
        
        bannerImageView.kf.setImage(with: banner.image)
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
