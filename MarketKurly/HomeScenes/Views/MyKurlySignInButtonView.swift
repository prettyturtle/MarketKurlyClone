//
//  MyKurlySignInButtonView.swift
//  MarketKurly
//
//  Created by yc on 2022/01/09.
//

import UIKit
import SnapKit

protocol MyKurlySignInButtonViewDelegate {
    func moveToSignInViewController()
}

class MyKurlySignInButtonView: UIView {
    
    var delegate: MyKurlySignInButtonViewDelegate?
    
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        
        label.text = "회원 가입하고\n다양한 혜택을 받아보세요!"
        label.font = .systemFont(ofSize: 16.0, weight: .light)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var benefitButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("가입 혜택 보기 ❯", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .light)
        
        return button
    }()
    
    private lazy var moveToSignInButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("로그인/회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .mainColor
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.layer.cornerRadius = 4.0
        button.addTarget(
            self,
            action: #selector(didTapMoveToSignInButton),
            for: .touchUpInside
        )
        
        return button
    }()
    @objc func didTapMoveToSignInButton() {
        delegate?.moveToSignInViewController()
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension MyKurlySignInButtonView {
    
    func setupLayout() {
        [
            messageLabel,
            benefitButton,
            moveToSignInButton
        ].forEach { addSubview($0) }
        
        messageLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
        }
        benefitButton.snp.makeConstraints { make in
            make.top.equalTo(messageLabel.snp.bottom).offset(4.0)
            make.centerX.equalTo(messageLabel)
        }
        moveToSignInButton.snp.makeConstraints { make in
            make.top.equalTo(benefitButton.snp.bottom).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(48.0)
            make.bottom.equalToSuperview().inset(32.0)
        }
    }
}
