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
    @Published var searchedText: String = ""
    
    private var subscriptions = Set<AnyCancellable>()
    private var newsDataService = NewsDataService()
    
    init() {
        addSubscriber()
    }
    
    private func addSubscriber() {
        
        $searchedText
            .combineLatest(newsDataService.$newsItems)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map(filterNews)
            .sink { [weak self] items in
                guard let self = self else { return }
                self.newsItems = items
            }
            .store(in: &subscriptions)
    }
    
    private func filterNews(text: String, items: [NewsItemModel]) -> [NewsItemModel] {
        guard !text.isEmpty else { return items }
        
        return items.filter { item in
            if let searchedKeywords = item.searchKeyWords {
                return searchedKeywords.contains(where: {$0.lowercased().contains(text.lowercased())})
            }
            return false
        }
    }
    
}
