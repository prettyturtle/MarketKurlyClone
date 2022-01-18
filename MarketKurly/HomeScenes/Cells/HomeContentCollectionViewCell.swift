//
//  HomeContentCollectionViewCell.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit
import SnapKit
import Kingfisher

protocol didTapHomeContentCollectionViewCellCartButtonDelegate: AnyObject {
    func presentAddCartViewController(content: Content?)
}

class HomeContentCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: didTapHomeContentCollectionViewCellCartButtonDelegate?
    
    private var content: Content?
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 2
        
        return label
    }()
    
    private lazy var discountRateLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        label.textColor = .systemRed
        
        return label
    }()
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .bold)
        
        return label
    }()
    
    private lazy var originalPriceLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 12.0, weight: .regular)
        label.textColor = .systemGray
        
        return label
    }()
    
    private lazy var cartButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(named: "ico_cart"), for: .normal)
        
        button.addTarget(
            self,
            action: #selector(didTapHomeContentCollectionViewCellCartButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    @objc func didTapHomeContentCollectionViewCellCartButton() {
        delegate?.presentAddCartViewController(content: content)
    }
    
    func setupView(content: Content) {
        setupLayout()
        self.content = content
        posterImageView.kf.setImage(with: content.imageURL)
        titleLabel.text = content.title
        priceLabel.text = content.price

        if content.isDiscounted {
            guard let discountRate = content.discountRate,
                  let originalPrice = content.originalPrice else { return }
            discountRateLabel.text = "\(discountRate)%"
            originalPriceLabel.strikedText(text: originalPrice)
        } else {
            discountRateLabel.isHidden = true
            originalPriceLabel.isHidden = true
        }
    }
    
}

private extension HomeContentCollectionViewCell {
    func setupLayout() {
        [
            posterImageView,
            titleLabel,
            discountRateLabel,
            priceLabel,
            originalPriceLabel,
            cartButton
        ].forEach { addSubview($0) }
        
        posterImageView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalTo(posterImageView.snp.width).multipliedBy(1.4)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(8.0)
            make.leading.trailing.equalToSuperview()
        }
        
        discountRateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(4.0)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(discountRateLabel.snp.trailing).offset(4.0)
            make.top.equalTo(discountRateLabel.snp.top)
        }
        
        originalPriceLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalTo(discountRateLabel.snp.bottom)
        }
        
        cartButton.snp.makeConstraints { make in
            make.width.height.equalTo(36.0)
            make.trailing.equalTo(posterImageView.snp.trailing).inset(8.0)
            make.bottom.equalTo(posterImageView.snp.bottom).inset(8.0)
        }
    }
}
