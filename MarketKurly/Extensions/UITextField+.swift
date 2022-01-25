//
//  UITextField+.swift
//  MarketKurly
//
//  Created by yc on 2022/01/25.
//

import UIKit

extension UITextField {
    func customStyle(placeholder: String?) {
        guard let placeholder = placeholder else { return }
        
        self.placeholder = placeholder
        self.leftView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 16.0, height: 0.0))
        self.leftViewMode = .always
        self.layer.borderColor = UIColor.separator.cgColor
        self.layer.borderWidth = 0.5
        self.layer.cornerRadius = 4.0
        
        self.snp.makeConstraints { make in
            make.height.equalTo(48.0)
        }
    }
}
