//
//  NewsDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/08/24.
//

import Foundation
import Combine

class NewsDataService {
    
    @Published var newsItems: [NewsItemModel] = []
    private var subscription: AnyCancellable?
    
    init() {
        getNews()
    }
    
    private func getURLRequest() -> URLRequest? {
        guard let url = URL(string: AppConstants.newsBaseURL) else { return nil}
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil}
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "limit", value: "20")
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems
        guard let componetURL = components.url else { return nil}
        var request = URLRequest(url: componetURL)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "X-API-KEY": AppConstants.newsAPIKey
        ]
        return request
    }
    
    func getNews(){
        guard let request = getURLRequest() else { return }
        subscription = NetworkingManager.downloading(request: request)
            .decode(type: NewsModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] result in
                guard let self = self else {return}
                self.newsItems = result.result
                self.subscription?.cancel()
            })
    }
}
