//
//  SignInViewController.swift
//  MarketKurly
//
//  Created by yc on 2022/01/10.
//

import UIKit
import SnapKit

class SignInViewController: UIViewController {
    
    private lazy var idTextField: UITextField = {
        let textField = UITextField()
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "아이디를 입력해주세요"
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.cornerRadius = 4.0
        
        return textField
    }()
    
    private lazy var pwTextField: UITextField = {
        let textField = UITextField()
        
        textField.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        textField.leftViewMode = .always
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.separator.cgColor
        textField.layer.cornerRadius = 4.0
        
        return textField
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "kurlyColor")
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.layer.cornerRadius = 4.0
        
        return button
    }()
    
    private lazy var findIdButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .thin)
        
        return button
    }()
    
    private lazy var seporatorView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .separator
        view.snp.makeConstraints { make in
            make.width.equalTo(1.0)
            make.height.equalTo(12.0)
        }
        
        return view
    }()
    
    private lazy var findPwButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14.0, weight: .thin)
        
        return button
    }()
    
    private lazy var findButtonStackView: UIStackView = {
        let stackView = UIStackView()
        
        stackView.distribution = .equalSpacing
        stackView.spacing = 8.0
        [
            findIdButton,
            seporatorView,
            findPwButton
        ].forEach { stackView.addArrangedSubview($0) }
        
        return stackView
    }()
    
    private lazy var moveToSignUpButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(UIColor(named: "kurlyColor"), for: .normal)
        button.backgroundColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.layer.borderColor = UIColor(named: "kurlyColor")?.cgColor
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 4.0
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupNavigationItem()
        setupLayout()
    }
    
    @objc func dismissSignInViewController() {
        dismiss(animated: true)
    }
}

private extension SignInViewController {
    func setupLayout() {
        [
            idTextField,
            pwTextField,
            signInButton,
            findButtonStackView,
            moveToSignUpButton
        ].forEach { view.addSubview($0) }
        
        idTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16.0)
            make.leading.trailing.equalToSuperview().inset(16.0)
            make.height.equalTo(48.0)
        }
        pwTextField.snp.makeConstraints { make in
            make.top.equalTo(idTextField.snp.bottom).offset(8.0)
            make.leading.equalTo(idTextField.snp.leading)
            make.trailing.equalTo(idTextField.snp.trailing)
            make.height.equalTo(48.0)
        }
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(pwTextField.snp.bottom).offset(16.0)
            make.leading.equalTo(idTextField.snp.leading)
            make.trailing.equalTo(idTextField.snp.trailing)
            make.height.equalTo(48.0)
        }
        findButtonStackView.snp.makeConstraints { make in
            make.top.equalTo(signInButton.snp.bottom).offset(16.0)
            make.centerX.equalTo(signInButton)
        }
        moveToSignUpButton.snp.makeConstraints { make in
            make.top.equalTo(findButtonStackView.snp.bottom).offset(48.0)
            make.leading.equalTo(idTextField.snp.leading)
            make.trailing.equalTo(idTextField.snp.trailing)
            make.height.equalTo(48.0)
        }
    }
    
    func setupNavigationItem() {
        navigationItem.title = "로그인"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(dismissSignInViewController)
        )
        navigationItem.leftBarButtonItem?.tintColor = .label
    }
}
