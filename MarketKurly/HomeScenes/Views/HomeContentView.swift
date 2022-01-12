//
//  HomeContentView.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit
import SnapKit

protocol HomeContentViewCellDelegate {
    func presentAddCartViewController(content: Content?)
}

class HomeContentView: UIView {

    var delegate: HomeContentViewCellDelegate?
    
    private let contentSection: ContentSection
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18.0, weight: .semibold)
        
        return label
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HomeContentCollectionViewCell.self, forCellWithReuseIdentifier: "HomeContentCollectionViewCell")
        
        return collectionView
    }()
    
    init(contentSection: ContentSection) {
        self.contentSection = contentSection
        super.init(frame: .zero)
        
        sectionTitleLabel.text = contentSection.sectionName
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeContentView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.4
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
}
extension HomeContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentSection.contentList.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeContentCollectionViewCell", for: indexPath) as? HomeContentCollectionViewCell else { return UICollectionViewCell() }
        
        let content = contentSection.contentList[indexPath.row]
        cell.setupView(content: content)
        
        cell.delegate = self
        
        return cell
    }
}

extension HomeContentView: didTapHomeContentCollectionViewCellCartButtonDelegate {
    func presentAddCartViewController(content: Content?) {
        delegate?.presentAddCartViewController(content: content)
    }
}

private extension HomeContentView {
    func setupLayout() {
        [
            sectionTitleLabel,
            collectionView
        ].forEach { addSubview($0) }
        
        sectionTitleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(16.0)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionTitleLabel.snp.bottom).offset(16.0)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(300.0)
        }
    }
}
