//
//  HomeStatModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 19/06/24.
//

import Foundation

struct HomeStatModel: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentDelta: Double?
    
    init(title: String, value: String, percentDelta: Double? = nil) {
        self.title = title
        self.value = value
        self.percentDelta = percentDelta
    }
}
