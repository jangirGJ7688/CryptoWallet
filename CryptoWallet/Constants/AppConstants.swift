//
//  AppConstants.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/06/24.
//

import Foundation

struct AppConstants {
    
    static let apiKey = "CG-v6bSe1Zmj4EZX6rv56FJ4XDP"
    static let newsAPIKey = "c1MpDXGi8r/MHl/H7kyFxJMZhkov0fPGFxLteRunMCw="
    static let baseURL = "https://api.coingecko.com/api/v3/coins/markets"
    static let globalMarketDataAPI = "https://api.coingecko.com/api/v3/global"
    static let coinDetailBaseURL = "https://api.coingecko.com/api/v3/coins/"
    static let newsBaseURL = "https://openapiv1.coinstats.app/news/"
    
    enum Endpoints: String {
        case coins
    }
    
    // Variables
    
    static let isUserLogined = "ISUSERLOGINED"
    static let isShowSignIn = "isShowSignIn".uppercased()
}
