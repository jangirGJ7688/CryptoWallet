//
//  NewsDetailDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 14/08/24.
//

import Foundation
import Combine

class NewsDetailDataService {
    
    @Published var newsItem: NewsItemModel? = nil
    private var subscription: AnyCancellable?
    private var newsItemId: String
    
    init(id: String) {
        self.newsItemId = id
        getNewsItemDetail()
    }
    
    private func getURLRequest() -> URLRequest? {
        guard let url = URL(string: AppConstants.newsBaseURL + self.newsItemId) else { return nil }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "X-API-KEY": AppConstants.newsAPIKey
        ]
        return request
    }
    
    func getNewsItemDetail(){
        guard let request = getURLRequest() else { return }
        subscription = NetworkingManager.downloading(request: request)
            .decode(type: NewsItemModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] item in
                guard let self = self else {return}
                self.newsItem = item
                self.subscription?.cancel()
            })
    }
}
