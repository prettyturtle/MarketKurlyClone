//
//  CategoryTableView.swift
//  MarketKurly
//
//  Created by yc on 2022/01/03.
//

import UIKit
import SnapKit

class CategoryTableView: UIView {
    private var categoryList: [Category]
    
    var currentTappedTitleSectionNumber: Int?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CategoryTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: CategoryTableViewHeaderView.identifier)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        return tableView
    }()
    
    init(categoryList: [Category]) {
        self.categoryList = categoryList
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CategoryTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CategoryTableViewHeaderView.identifier) as? CategoryTableViewHeaderView else { return nil }
        
        let categoryItem = categoryList[section]
        header.setupView(categoryItem: categoryItem, section: section)
        header.delegate = self
        
        return header
    }
}

extension CategoryTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        categoryList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case currentTappedTitleSectionNumber:
            return categoryList[section].subCategory.count
        default:
            return 0
        }
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") else { return UITableViewCell() }
        
        cell.textLabel?.text = categoryList[indexPath.section].subCategory[indexPath.row]
        
        return cell
    }
}

extension CategoryTableView: CategoryTableViewHeaderViewDelegate {
    func didTapCategoryTitle(section: Int?) {
        
        // TODO: 아래 코드 깔끔하게 고치기
        guard let section = section else { return }
//        var indexSetArray = [Int]()
        
        if currentTappedTitleSectionNumber == section {
            currentTappedTitleSectionNumber = nil
            tableView.reloadSections([section], with: .automatic)
        } else {
            guard let pastSectionNumber = currentTappedTitleSectionNumber else {
                currentTappedTitleSectionNumber = section
                tableView.reloadSections([currentTappedTitleSectionNumber!], with: .automatic)
                return
            }
            currentTappedTitleSectionNumber = section
            tableView.reloadSections([pastSectionNumber, currentTappedTitleSectionNumber!], with: .automatic)
        }
        
    }
}

private extension CategoryTableView {
    func setupLayout() {
        addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
