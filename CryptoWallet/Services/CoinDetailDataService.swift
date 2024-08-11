//
//  CoinDetailDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 10/08/24.
//

import Foundation
import Combine

class CoinDetailDataService {
    
    @Published var coinData: CoinDetailModel? = nil
    
    var subscription: AnyCancellable?
    let coinID: String
    
    init(coinID: String) {
        self.coinID = coinID
        getMarketData()
    }
    
    
    private func getURLRequest() -> URLRequest? {
        guard let url = URL(string: AppConstants.coinDetailBaseURL + coinID) else { return nil}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "X-API-KEY": AppConstants.apiKey
        ]
        return request
    }
    
    func getMarketData() {
        guard let request = getURLRequest() else { return }
        subscription = NetworkingManager.downloading(request: request)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] coinData in
                guard let self = self else { return }
                self.coinData = coinData
                self.subscription?.cancel()
            })
    }
    
}

