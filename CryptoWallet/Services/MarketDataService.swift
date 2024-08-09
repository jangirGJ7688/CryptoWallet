//
//  MarketDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 19/06/24.
//

import Foundation
import Combine

class MarketDataService {
    
    @Published var statData: MarketDataModel? = nil
    
    var subscription: AnyCancellable?
    
    init() {
        getMarketData()
    }
    
    
    private func getURLRequest() -> URLRequest? {
        guard let url = URL(string: AppConstants.globalMarketDataAPI) else { return nil}
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
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] globalData in
                guard let self = self else { return }
                self.statData = globalData.data
                self.subscription?.cancel()
            })
    }
    
}
