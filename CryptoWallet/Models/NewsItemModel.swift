//
//  NewsItemModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/08/24.
//

import Foundation

struct NewsModel: Decodable {
    let result: [NewsItemModel]
}


struct NewsItemModel: Decodable {
    let id: String
    let searchKeyWords: [String]?
    let feedDate: Int
    let source, title: String
    let isFeatured: Bool?
    let imgUrl: String
    let shareURL: String?
    let relatedCoins: [String]?
    let link: String?
    
}
