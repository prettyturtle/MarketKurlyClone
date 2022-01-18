//
//  MyKurlyViewController.swift
//  MarketKurly
//
//  Created by yc on 2022/01/09.
//

import UIKit
import SnapKit

class MyKurlyViewController: UIViewController {
    
    private let myKurlySectionMenu = [
        ["비회원 주문 조회", "알림 설정"],
        ["컬리소개", "배송 안내", "공지사항", "자주하는 질문", "고객센터", "이용안내"]
    ]
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    @objc func refresh() {
        print("myKurlySignInButtonView - refreshControl - refresh")
        refreshControl.endRefreshing()
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        scrollView.showsVerticalScrollIndicator = false
        scrollView.refreshControl = refreshControl
        
        return scrollView
    }()
    private let contentView = UIView()
    
    private let myKurlySignInButtonView = MyKurlySignInButtonView()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.dataSource = self
        
        tableView.isScrollEnabled = false
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height: .leastNonzeroMagnitude))
        tableView.sectionHeaderHeight = 8.0
        tableView.sectionFooterHeight = 0.0
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGroupedBackground
        navigationController?.setupNavigationItem(
            self,
            titleType: .text,
            image: nil,
            text: "마이컬리"
        )
        setupLayout()
        myKurlySignInButtonView.delegate = self
    }
}

extension MyKurlyViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return myKurlySectionMenu.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myKurlySectionMenu[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        
        cell.textLabel?.text = myKurlySectionMenu[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 16.0, weight: .light)
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        return cell
    }
}
extension MyKurlyViewController: MyKurlySignInButtonViewDelegate {
    func moveToSignInViewController() {
        let signInViewController = UINavigationController(rootViewController: SignInViewController())
        signInViewController.modalPresentationStyle = .fullScreen
        present(signInViewController, animated: true)
    }
}

private extension MyKurlyViewController {
    func setupLayout() {
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        [
            myKurlySignInButtonView,
            tableView
        ].forEach { contentView.addSubview($0) }
        
        myKurlySignInButtonView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(myKurlySignInButtonView.snp.bottom).offset(8.0)
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(45.0 * 8.0 + 8.0)
        }
    }
}
