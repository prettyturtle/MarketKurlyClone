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
    
    func changeTextColor(from text: String?, at range: [String]?) {
        guard let text = text,
              let range = range else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.mainColor]
        
        range.forEach {  attributedString.addAttributes(attributes, range: NSString(string: text).range(of: $0)) }
       
        self.attributedText = attributedString
    }
}
