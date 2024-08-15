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
    
    var limit: Int
    
    init(limit: Int = 20) {
        self.limit = limit
        getNews()
    }
    
    private func getURLRequest(page: Int) -> URLRequest? {
        guard let url = URL(string: AppConstants.newsBaseURL) else { return nil}
        guard var components = URLComponents(url: url, resolvingAgainstBaseURL: true) else { return nil}
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "page", value: "\(page)"),
          URLQueryItem(name: "limit", value: "\(limit)")
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
    
    func getNews(page: Int = 1){
        guard let request = getURLRequest(page: page) else { return }
        subscription = NetworkingManager.downloading(request: request)
            .decode(type: NewsModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] result in
                guard let self = self else {return}
                self.newsItems.append(contentsOf: result.result)
                self.subscription?.cancel()
            })
    }
}
