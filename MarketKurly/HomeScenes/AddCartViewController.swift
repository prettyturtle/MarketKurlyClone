//
//  AddCartViewController.swift
//  MarketKurly
//
//  Created by yc on 2022/01/13.
//

import UIKit
import SnapKit

class AddCartViewController: UIViewController {
    
    var content: Content?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 14.0, weight: .light)
        
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
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        
        label.text = "1"
        label.font = .systemFont(ofSize: 16.0, weight: .medium)
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("﹣", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .semibold)
        button.addTarget(
            self,
            action: #selector(didTapMinusButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("﹢", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .semibold)
        button.addTarget(
            self,
            action: #selector(didTapPlusButton),
            for: .touchUpInside
        )
        
        return button
    }()
    
    @objc func didTapMinusButton() {
        guard let count = Int(countLabel.text!) else { return }
        
        if count == 1 {
            print("최소 주문 수량은 1개 입니다.")
        } else {
            countLabel.text = "\(count - 1)"
        }
    }
    
    @objc func didTapPlusButton() {
        guard let count = Int(countLabel.text!) else { return }
        
        if count == 99 {
            print("최대 주문 수량은 99개 입니다.")
        } else {
            countLabel.text = "\(count + 1)"
        }
        
    }
    
    private lazy var countStepper: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fillEqually
        [
            minusButton,
            countLabel,
            plusButton
        ].forEach { stackView.addArrangedSubview($0) }
        
        stackView.layer.borderColor = UIColor.separator.cgColor
        stackView.layer.borderWidth = 1.0
        stackView.layer.cornerRadius = 4.0
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.setupPresentedNavigationItem(
            self,
            titleOfNavigationItem: "상품 선택",
            leftBarButtonAction: #selector(dismissAddCartViewController)
        )
        setupView()
    }
    @objc func dismissAddCartViewController() {
        dismiss(animated: true)
    }
    
    func setupView() {
        setupLayout()
        
        guard let content = content else { return }
        
        titleLabel.text = content.title
        priceLabel.text = content.price
        originalPriceLabel.text = content.originalPrice
    }
}

private extension AddCartViewController {
    func setupLayout() {
        [
            titleLabel,
            priceLabel,
            originalPriceLabel,
            countStepper
        ].forEach { view.addSubview($0) }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalTo(view.safeAreaLayoutGuide).inset(16.0)
        }
        priceLabel.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.leading)
            make.top.equalTo(titleLabel.snp.bottom).offset(24.0)
        }
        originalPriceLabel.snp.makeConstraints { make in
            make.leading.equalTo(priceLabel.snp.trailing).offset(4.0)
            make.bottom.equalTo(priceLabel.snp.bottom)
        }
        countStepper.snp.makeConstraints { make in
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.bottom.equalTo(priceLabel.snp.bottom)
            make.width.equalTo(94.0)
            make.height.equalTo(32.0)
        }
    }
}
