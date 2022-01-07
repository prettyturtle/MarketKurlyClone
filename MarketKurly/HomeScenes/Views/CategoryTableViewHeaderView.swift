//
//  CategoryTableViewCell.swift
//  MarketKurly
//
//  Created by yc on 2022/01/07.
//

import UIKit
import SnapKit

class CategoryTableViewHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "CategoryTableViewHeaderView"
    
    private lazy var categoryIconImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)

        return label
    }()
    private lazy var disclosureIndicator: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "chevron.down")
        imageView.tintColor = .tertiaryLabel
        
        return imageView
    }()
    
    func setupView(categoryItem: Category) {
        setupLayout()
        
        titleLabel.text = categoryItem.title
        categoryIconImageView.image = UIImage(named: categoryItem.image)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapCategoryTitle(_:)))
        self.addGestureRecognizer(tap)
    }
    
    @objc func didTapCategoryTitle(_ sender: UITapGestureRecognizer) {
        print(sender)
        // TODO: 카테고리 선택 시, 서브메뉴 보이기
    }
}

private extension CategoryTableViewHeaderView {
    func setupLayout() {
        [
            categoryIconImageView,
            titleLabel,
            disclosureIndicator
        ].forEach { addSubview($0) }
        
        categoryIconImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16.0)
            make.top.equalToSuperview().inset(8.0)
            make.bottom.equalToSuperview().inset(8.0)
            make.width.height.equalTo(30.0)
        }
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(categoryIconImageView)
            make.leading.equalTo(categoryIconImageView.snp.trailing).offset(8.0)
        }
        disclosureIndicator.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16.0)
            make.centerY.equalTo(categoryIconImageView)
            make.width.height.equalTo(20.0)
        }
    }
}
