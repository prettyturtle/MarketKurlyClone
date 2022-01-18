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
    
    private var currentTappedTitleSectionNumber: Int?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 0.3
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            CategoryTableViewHeaderView.self,
            forHeaderFooterViewReuseIdentifier: CategoryTableViewHeaderView.identifier
        )
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
        
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
        
        guard let header = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: CategoryTableViewHeaderView.identifier
        ) as? CategoryTableViewHeaderView else { return nil }
        
        let categoryItem = categoryList[section]
        header.setupView(categoryItem: categoryItem, section: section)
        if currentTappedTitleSectionNumber == section {
            header.didSelected()
        }
        header.delegate = self
        
        return header
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let sectionSeparator = UIView()
        sectionSeparator.backgroundColor = .separator
        return sectionSeparator
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
    
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CategoryTableViewCell.identifier,
            for: indexPath
        ) as? CategoryTableViewCell else { return UITableViewCell() }
        
        let subTitle = categoryList[indexPath.section].subCategory[indexPath.row]
        cell.selectionStyle = .none
        cell.setupView(subTitle: subTitle)
        
        return cell
    }
}

extension CategoryTableView: CategoryTableViewHeaderViewDelegate {
    func didTapCategoryTitle(section: Int?) {
        
        guard let section = section else { return }
        guard let pastSectionNumber = currentTappedTitleSectionNumber else {
            currentTappedTitleSectionNumber = section
            tableView.reloadSections([section], with: .automatic)
            return
        }
        if currentTappedTitleSectionNumber == section {
            currentTappedTitleSectionNumber = nil
            tableView.reloadSections([section], with: .automatic)
        } else {
            currentTappedTitleSectionNumber = section
            tableView.reloadSections([pastSectionNumber, section], with: .automatic)
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
