//
//  CoinDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 15/06/24.
//

import Foundation
import Combine

class CoinDataService {
    
    @Published var allCoins: [CoinModel] = []
    var subscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getURLRequest() -> URLRequest? {
        guard let url = URL(string: AppConstants.baseURL) else { return nil}
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil}
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "per_page", value: "250"),
          URLQueryItem(name: "vs_currency", value: "usd"),
          URLQueryItem(name: "sparkline", value: "true"),
          URLQueryItem(name: "price_change_percentage", value: "24h"),
          URLQueryItem(name: "order", value: "market_cap_desc")
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        guard let componetURL = components.url else { return nil}
        var request = URLRequest(url: componetURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "x-cg-pro-api-key": AppConstants.apiKey
        ]
        return request
    }
    
    func getCoins(){
        guard let request = getURLRequest() else { return }
        subscription = NetworkingManager.downloading(request: request)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] result in
                guard let self = self else {return}
                self.allCoins = result
                self.subscription?.cancel()
            })
    }
}
