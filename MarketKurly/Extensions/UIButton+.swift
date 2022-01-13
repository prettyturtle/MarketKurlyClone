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
}
