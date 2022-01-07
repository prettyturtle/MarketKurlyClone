//
//  CategoryCollectionViewCell.swift
//  MarketKurly
//
//  Created by yc on 2022/01/03.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier = "CategoryCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.backgroundColor = .secondarySystemFill
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        
        return label
    }()
    
    func setupView() {
        setupLayout()
        
        titleLabel.text = "titleLabel"
        imageView.image = UIImage(systemName: "star")
    }
}

private extension CategoryCollectionViewCell {
    func setupLayout() {
        [
            imageView,
            titleLabel
        ].forEach { addSubview($0) }
        
        imageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8.0)
            make.leading.trailing.bottom.equalToSuperview().inset(8.0)
        }
    }
}
