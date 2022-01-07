//
//  Category.swift
//  MarketKurly
//
//  Created by yc on 2022/01/07.
//

import Foundation

struct Category: Decodable {
    let title: String
    let image: String
    let subCategory: [String]
}
