//
//  CoinChartModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 23/06/24.
//

import Foundation

struct CoinChartModel: Identifiable, Decodable {
    var id: String = UUID().uuidString
    var x: Double
    var value: Double
}
