//
//  MarketDataModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 19/06/24.
//

import Foundation

struct GlobalData: Decodable {
    let data: MarketDataModel?
}

struct MarketDataModel: Decodable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String:Double]
    let marketCapChangePercentage24H: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24H = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return item.value.formatWithAbservation()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return item.value.formatWithAbservation()
        }
        return ""
    }
    
    var btcDominace: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return item.value.asPercentString()
        }
        return ""
    }
}
