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
    private lazy var homeFooterView = HomeFooterView()
    
    private lazy var scrollToTopButton: UIButton = {
        let button = UIButton()
        
        button.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .systemBackground
        button.layer.borderColor = UIColor.separator.cgColor
        button.layer.borderWidth = 0.4
        button.layer.cornerRadius = 25.0
        
        button.isHidden = true
        
        button.addTarget(
            self,
            action: #selector(didTapScrollToTopButton),
            for: .touchUpInside
        )
        
        return button
    }()
    @objc func didTapScrollToTopButton() {
        scrollView.setContentOffset(CGPoint(x: 0.0, y: 0.0), animated: true)
    }
    
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
        scrollView.delegate = self
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let criteria: CGFloat = UIScreen.main.bounds.height / 4
        
        switch scrollView.contentOffset.y {
        case (...criteria):
            scrollToTopButton.isHidden = true
        case (criteria...):
            scrollToTopButton.isHidden = false
        default:
            break
        }
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
            make.edges.equalTo(view.safeAreaLayoutGuide)
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
        stackView.addArrangedSubview(homeFooterView)
        
        view.addSubview(scrollToTopButton)
        scrollToTopButton.snp.makeConstraints { make in
            make.width.height.equalTo(50.0)
            make.trailing.bottom.equalTo(view.safeAreaLayoutGuide).inset(16.0)
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
