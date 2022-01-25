//
//  UIButton+.swift
//  MarketKurly
//
//  Created by yc on 2022/01/13.
//

import UIKit
import SnapKit

extension UIButton {
    static func mainColorButton(_ target: Any?, title: String?, isReversed: Bool, action: Selector) -> UIButton {
        let button = UIButton()
        
        button.setTitle(title ?? "", for: .normal)
        button.setTitleColor(isReversed ? .mainColor : .white, for: .normal)
        button.backgroundColor = isReversed ? .white : .mainColor
        button.titleLabel?.font = .systemFont(ofSize: 16.0, weight: .medium)
        button.layer.cornerRadius = 4.0
        button.addTarget(target, action: action, for: .touchUpInside)
        
        if isReversed {
            button.layer.borderColor = UIColor.mainColor.cgColor
            button.layer.borderWidth = 0.5
        }
        
        button.snp.makeConstraints { make in
            make.height.equalTo(48.0)
        }
                
        return button
    }
    
    func checkButton(tag: Int) -> UIButton {
        self.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        self.tintColor = .tertiaryLabel
        self.contentHorizontalAlignment = .fill
        self.contentVerticalAlignment = .fill
        self.tag = tag
        self.addTarget(self, action: #selector(didTapCheckButton(_:)), for: .touchUpInside)
        
        self.snp.makeConstraints { make in
            make.width.height.equalTo(25.0)
        }
        return self
    }
    @objc func didTapCheckButton(_ sender: UIButton) {
        if sender.tintColor != .mainColor {
            sender.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            sender.tintColor = .mainColor
        } else {
            sender.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            sender.tintColor = .tertiaryLabel
        }
        print(sender.tag)
    }
}
