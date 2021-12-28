//
//  HomeContentCollectionHeaderView.swift
//  MarketKurly
//
//  Created by yc on 2021/12/28.
//

import UIKit
import SnapKit

class HomeContentCollectionHeaderView: UICollectionReusableView {
    private lazy var sectionNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18.0, weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    func setupView(headerString: String) {
        setupLayout()
        
        sectionNameLabel.text = headerString
    }
}

private extension HomeContentCollectionHeaderView {
    func setupLayout() {
        addSubview(sectionNameLabel)
        
        sectionNameLabel.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
        }
    }
}
