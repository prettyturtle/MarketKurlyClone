//
//  UILabel+.swift
//  MarketKurly
//
//  Created by yc on 2022/01/18.
//

import UIKit

extension UILabel {
    func strikedText(text: String?) {
        guard let text = text else { return }
        let attributes = [NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        let strikeAttributedString = NSAttributedString(string: text, attributes: attributes)
        self.attributedText = strikeAttributedString
    }
}
