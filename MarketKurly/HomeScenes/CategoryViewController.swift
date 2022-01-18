//
//  CategoryViewController.swift
//  MarketKurly
//
//  Created by yc on 2022/01/01.
//

import UIKit
import SnapKit

class CategoryViewController: UIViewController {
    
    private var categoryList = [Category]()
    
    private lazy var tableView = CategoryTableView(categoryList: categoryList)
    private lazy var collectionView = CategoryCollectionView()
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setupNavigationItem(
            self,
            titleType: .text,
            image: nil,
            text: "카테고리"
        )
        fetchData()
        setupLayout()
    }
}

private extension CategoryViewController {
    
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "CategoryList", withExtension: "plist") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([Category].self, from: data)
            categoryList = result
        } catch {
            print("extension CategoryViewController - func fetchData() - catch Error")
        }
    }
    
    func setupLayout() {
        // TODO: 스크롤뷰와 스택뷰로 구현하기
//        view.addSubview(scrollView)
//        scrollView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//        scrollView.addSubview(contentView)
//        contentView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//            make.width.equalToSuperview()
//        }
//        contentView.addSubview(stackView)
//
//        stackView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//
//        [
//            tableView,
//            collectionView
//        ].forEach { stackView.addArrangedSubview($0) }
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
