//
//  HomeViewController.swift
//  MarketKurly
//
//  Created by yc on 2021/12/26.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    private var contentSectionList = [ContentSection]()

    private let scrollView = UIScrollView()
    private let scrollContentView = UIView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 0.0
        
        return stackView
    }()
    
    private lazy var homeMainBannerView = HomeMainBannerView(frame: .zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        navigationController?.setupNavigationItem(
            self,
            titleType: .image,
            image: UIImage(named: "kurly_logo"),
            text: nil
        )
        setupLayout()
        view.backgroundColor = .systemBackground
    }
}

private extension HomeViewController {
    func fetchData() {
        guard let url = Bundle.main.url(forResource: "HomeContentList", withExtension: "plist") else { return }
        do {
            let data = try Data(contentsOf: url)
            let result = try PropertyListDecoder().decode([ContentSection].self, from: data)
            contentSectionList = result
        } catch {
            print("extension HomeViewController - func fetchData() - catch Error")
        }
    }
    
    func setupLayout() {
        
        view.addSubview(scrollView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.addSubview(scrollContentView)
        
        scrollContentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        scrollContentView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        stackView.addArrangedSubview(homeMainBannerView)
        
        contentSectionList.forEach {
            let homeContentView = HomeContentView(contentSection: $0)
            homeContentView.delegate = self
            stackView.addArrangedSubview(homeContentView)
        }
    }
}

extension HomeViewController: HomeContentViewCellDelegate {
    func presentAddCartViewController(content: Content?) {
        let rootViewController = AddCartViewController()
        rootViewController.content = content
        let addCartNavigationViewController = UINavigationController(rootViewController: rootViewController)
        present(addCartNavigationViewController, animated: true, completion: nil)
    }
}
