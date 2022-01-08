//
//  Content.swift
//  MarketKurly
//
//  Created by yc on 2022/01/08.
//

import Foundation

struct ContentSection: Decodable {
    let sectionName: String
    let contentList: [Content]
}

struct Content: Decodable {
    let title: String
    let price: String
    let isDiscounted: Bool
    let discountRate: Int?
    let originalPrice: String?
    let imageURL: String
}
