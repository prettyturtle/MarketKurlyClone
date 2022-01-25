//
//  HomeFooterView.swift
//
//
//  Created by yc on 2022/01/24.
//

import UIKit
import SnapKit

class HomeFooterView: UIView {
    
    private let infoText = """
                 주식회사 컬리 | 대표자 : 김슬아
                 개인정보보호책임자 : 이원준
                 사업자등록번호 : 261-81-23567 사업자정보 확인
                 통신판매업 : 제 2018-서울강남-01646 호
                 주소 : 서울특별시 강남구 테헤란로 133, 18층(역삼동)
                 
                 입점문의 : 입점문의하기
                 제휴문의 : business@kurlycorp.com
                 팩스 : 070-7500-6098 | 이메일 : help@kurlycorp.com
                 고객행복센터 : 1644-1107
                 대량주문 문의 : kurlygift@kurlycorp.com
                 
                 카카오톡 @마켓컬리 친구 추가하고 소식과 혜택을 받아보세요.
                 """
    private let changedColorText: [String] = [
        "사업자정보 확인",
        "입점문의하기",
        "business@kurlycorp.com",
        "help@kurlycorp.com",
        "1644-1107",
        "kurlygift@kurlycorp.com",
        "@마켓컬리"
    ]
    
    private lazy var introductionButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("컬리소개", for: .normal)
        button.setTitleColor(.systemGray2, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
        
        return button
    }()
    
    private lazy var serviceButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("이용약관", for: .normal)
        button.setTitleColor(.systemGray2, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
        
        return button
    }()
    
    private lazy var privacyButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("개인정보처리방침", for: .normal)
        button.setTitleColor(.systemGray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12.0, weight: .bold)
        
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 16.0
        
        [
            introductionButton,
            serviceButton,
            privacyButton
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 11.0, weight: .light)
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.text = infoText
        
        label.changeTextColor(from: infoText, at: changedColorText, color: .mainColor)
        
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .secondarySystemBackground
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension HomeFooterView {
    func setupLayout() {
        [
            buttonStackView,
            infoLabel
        ].forEach { addSubview($0) }
        
        buttonStackView.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16.0)
        }
        infoLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.top.equalTo(buttonStackView.snp.bottom).offset(16.0)
            make.bottom.equalToSuperview().inset(16.0)
        }
    }
}
