//
//  CategoryTableViewCell.swift
//  MarketKurly
//
//  Created by yc on 2022/01/07.
//

import UIKit
import SnapKit

class CategoryTableViewCell: UITableViewCell {
    
    static let identifier = "CategoryTableViewCell"
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .medium)
        
        return label
    }()
    
    func setupView(subTitle: String) {
        setupLayout()
        backgroundColor = .secondarySystemBackground
        subTitleLabel.text = subTitle
    }
}

private extension CategoryTableViewCell {
    func setupLayout() {
        addSubview(subTitleLabel)
        
        subTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(48.0)
            make.top.bottom.equalToSuperview().inset(12.0)
        }
    }
}
