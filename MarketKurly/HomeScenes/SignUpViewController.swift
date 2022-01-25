//
//  SignUpViewController.swift
//  MarketKurly
//
//  Created by yc on 2022/01/25.
//

import UIKit
import SnapKit

class SignUpViewController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let commonInset: CGFloat = 16.0
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "아이디*", at: "*", color: .necessaryColor)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        
        textField.customStyle(placeholder: "예 : marketkurly12")
        
        return textField
    }()
    
    private lazy var idStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = commonInset / 2.0
        
        [
            idLabel,
            idTextField
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "비밀번호*", at: "*", color: .necessaryColor)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        
        textField.customStyle(placeholder: "비밀번호를 입력해주세요")
        textField.isSecureTextEntry = true

        return textField
    }()
    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = commonInset / 2.0
        
        [
            passwordLabel,
            passwordTextField
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var rePasswordLabel: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "비밀번호 확인*", at: "*", color: .necessaryColor)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var rePasswordTextField: UITextField = {
        let textField = UITextField()
        
        textField.customStyle(placeholder: "비밀번호를 한번 더 입력해주세요")
        textField.isSecureTextEntry = true

        return textField
    }()
    private lazy var rePasswordStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = commonInset / 2.0
        
        [
            rePasswordLabel,
            rePasswordTextField
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "이름*", at: "*", color: .necessaryColor)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        
        textField.customStyle(placeholder: "이름을 입력해주세요")
        
        return textField
    }()
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = commonInset / 2.0
        
        [
            nameLabel,
            nameTextField
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "이메일*", at: "*", color: .necessaryColor)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        
        textField.customStyle(placeholder: "예 : marketkurly@kurly.com")
        textField.keyboardType = .emailAddress
        
        return textField
    }()
    private lazy var emailStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = commonInset / 2.0
        
        [
            emailLabel,
            emailTextField
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "휴대폰*", at: "*", color: .necessaryColor)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        
        textField.customStyle(placeholder: "숫자만 입력해주세요")
        textField.keyboardType = .phonePad
        
        return textField
    }()
    private lazy var phoneNumberStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = commonInset / 2.0
        
        [
            phoneNumberLabel,
            phoneNumberTextField
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var termsConditionsLabel: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "이용약관동의*", at: "*", color: .necessaryColor)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    
    private lazy var agreeAllCheckButton = UIButton().checkButton(tag: 0)
    private lazy var agreeAllLabel: UILabel = {
        let label = UILabel()
        
        label.text = "전체 동의합니다."
        label.font = .systemFont(ofSize: 16.0, weight: .semibold)
        
        return label
    }()
    private lazy var agreeAllStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fill
        stackView.spacing = commonInset / 2.0
        
        [
            agreeAllCheckButton,
            agreeAllLabel
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var termsConditionsDescriptionLabel: UILabel = {
        let label = UILabel()
        
        label.text = "선택 항목에 동의하지 않는 경우도 회원가입 및 일반적인 서비스를 이용할 수 있습니다."
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14.0, weight: .thin)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    private lazy var a이용약관동의CheckButton = UIButton().checkButton(tag: 1)
    private lazy var a이용약관동의Label: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "이용약관 동의 (필수)", at: "(필수)", color: .secondaryLabel)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var a이용약관동의StackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fill
        stackView.spacing = commonInset / 2.0
        
        [
            a이용약관동의CheckButton,
            a이용약관동의Label
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var a개인정보수집이용동의CheckButton = UIButton().checkButton(tag: 2)
    private lazy var a개인정보수집이용동의Label: UILabel = {
        let label = UILabel()
        
        label.changeTextColor(from: "개인정보 수집·이용 동의 (필수)", at: "(필수)", color: .secondaryLabel)
        label.font = .systemFont(ofSize: 14.0, weight: .regular)
        
        return label
    }()
    private lazy var a개인정보수집이용동의StackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .fill
        stackView.spacing = commonInset / 2.0
        
        [
            a개인정보수집이용동의CheckButton,
            a개인정보수집이용동의Label
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var termsConditionsStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = commonInset
        
        [
            termsConditionsLabel,
            agreeAllStackView,
            termsConditionsDescriptionLabel,
            separatorView,
            a이용약관동의StackView,
            a개인정보수집이용동의StackView
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var submitButton = UIButton.mainColorButton(
        self,
        title: "가입하기",
        isReversed: false,
        action: #selector(didTapSubmitButton)
    )
    @objc func didTapSubmitButton() {
        print("didTapSubmitButton")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationItem()
        setupLayout()
    }
}

private extension SignUpViewController {
    func setupNavigationItem() {
        navigationController?.navigationBar.tintColor = .label
        navigationItem.title = "회원가입"
        navigationController?.navigationBar.topItem?.title = ""
    }
    
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
            idStackView, passwordStackView,
            rePasswordStackView, nameStackView,
            emailStackView, phoneNumberStackView,
            termsConditionsStackView,
            submitButton
        ].forEach { contentView.addSubview($0) }
        
        idStackView.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview().inset(commonInset)
        }
        passwordStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(commonInset)
            make.top.equalTo(idStackView.snp.bottom).offset(commonInset)
        }
        rePasswordStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(commonInset)
            make.top.equalTo(passwordStackView.snp.bottom).offset(commonInset)
        }
        nameStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(commonInset)
            make.top.equalTo(rePasswordStackView.snp.bottom).offset(commonInset)
        }
        emailStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(commonInset)
            make.top.equalTo(nameStackView.snp.bottom).offset(commonInset)
        }
        phoneNumberStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(commonInset)
            make.top.equalTo(emailStackView.snp.bottom).offset(commonInset)
        }
        termsConditionsStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(commonInset)
            make.top.equalTo(phoneNumberStackView.snp.bottom).offset(commonInset * 2)
        }
        submitButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(commonInset)
            make.top.equalTo(termsConditionsStackView.snp.bottom).offset(commonInset * 2)
            make.bottom.equalToSuperview().inset(commonInset)
        }
        
        separatorView.snp.makeConstraints { make in
            make.height.equalTo(0.4)
        }
    }
}
