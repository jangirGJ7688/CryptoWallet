//
//  NewsViewModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/08/24.
//

import Foundation
import Combine

class NewsTabViewModel: ObservableObject {
    
    
    @Published var newsItems: [NewsItemModel] = []
    
    private var subscriptions = Set<AnyCancellable>()
    private var newsDataService = NewsDataService()
    
    init() {
        addSubscriber()
    }
    
    private func addSubscriber() {
        newsDataService
            .$newsItems
            .sink { [weak self] items in
                guard let self = self else { return }
                self.newsItems = items
            }
            .store(in: &subscriptions)
    }
    
}
