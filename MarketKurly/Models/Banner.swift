//
//  Banner.swift
//  MarketKurly
//
//  Created by yc on 2022/01/19.
//

import Foundation

struct Banner: Decodable {
    private let imageURL: String
    var image: URL? {
        return URL(string: imageURL)
    }
}
