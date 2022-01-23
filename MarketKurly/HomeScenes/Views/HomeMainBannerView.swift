//
//  HomeMainBannerView.swift
//  MarketKurly
//
//  Created by yc on 2021/12/27.
//

import UIKit
import SnapKit

class HomeMainBannerView: UIView {
    
    private var bannerList = [Banner]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(
            HomeMainBannerCollectionViewCell.self,
            forCellWithReuseIdentifier: "HomeMainBannerCollectionViewCell"
        )
        
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeMainBannerView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0
    }
}
extension HomeMainBannerView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "HomeMainBannerCollectionViewCell",
            for: indexPath
        ) as? HomeMainBannerCollectionViewCell else { return UICollectionViewCell() }
        
        let banner = bannerList[indexPath.row]
        
        cell.setupView(banner: banner)
        
        return cell
    }
}

private extension HomeMainBannerView {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "HomeBannerList", withExtension: "plist") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Banner].self, from: data)
            bannerList = result
        } catch {
            print("ERROR - HomeMainBannerView - fetchData")
        }
    }
    func setupLayout() {
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(snp.width).multipliedBy(978.0/1080.0)
        }
    }
}
