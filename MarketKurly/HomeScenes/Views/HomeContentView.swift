//
//  HomeContentView.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit
import SnapKit

class HomeContentView: UIView {

    private let contentList: String
    
    private lazy var sectionTitleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 18.0, weight: .semibold)
        label.textColor = .label
        label.text = contentList
        
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
    
    init(contentList: String) {
        self.contentList = contentList
        
        super.init(frame: .zero)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomeContentView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width * 0.4
        return CGSize(width: width, height: width * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 16.0
        
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
}
extension HomeContentView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeContentCollectionViewCell", for: indexPath) as? HomeContentCollectionViewCell else { return UICollectionViewCell() }
        
        let index = indexPath.row
        cell.setupView(index: index)
        
        return cell
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
        }
    }
}
