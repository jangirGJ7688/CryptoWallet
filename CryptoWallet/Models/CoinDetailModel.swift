//
//  CoinDetailModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 10/08/24.
//

import Foundation

struct CoinDetailModel: Decodable {
    let id, symbol, name: String
    let blockTimeInMinutes: Int?
    let hashingAlgorithm: String?
    let description: Description?
    let links: Links?

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, description, links
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
    }
}

struct Description: Decodable {
    let en: String
}

struct Links: Decodable {
    let homepage: [String]?
    let subredditURL: String?

    enum CodingKeys: String, CodingKey {
        case homepage
        case subredditURL = "subreddit_url"
    }
}
