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
    
    /// 라벨의 텍스트에서 여러 부분의 색상을 변경하는 메소드(text: 넣고싶은 문자열, range: 바꾸고 싶은 부분들을 배열로, color: 바꾸고 싶은 색상)
    func changeTextColor(from text: String?, at range: [String]?, color: UIColor) {
        guard let text = text,
              let range = range else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        
        range.forEach {  attributedString.addAttributes(attributes, range: NSString(string: text).range(of: $0)) }
       
        self.attributedText = attributedString
    }
    /// 라벨의 텍스트에서 여러 부분의 색상을 변경하는 메소드(text: 넣고싶은 문자열, range: 바꾸고 싶은 부분을 문자열로, color: 바꾸고 싶은 색상)
    func changeTextColor(from text: String?, at range: String?, color: UIColor) {
        guard let text = text,
              let range = range else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        let attributes = [NSAttributedString.Key.foregroundColor: color]
        
        attributedString.addAttributes(attributes, range: NSString(string: text).range(of: range))
       
        self.attributedText = attributedString
    }
}
