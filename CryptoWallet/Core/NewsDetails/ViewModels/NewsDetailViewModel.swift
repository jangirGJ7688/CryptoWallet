//
//  NewsDetailViewModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 14/08/24.
//

import Foundation
import Combine

class NewsDetailViewModel: ObservableObject {
    
    @Published var newsItem: NewsItemModel? = nil
    
    private var subscription = Set<AnyCancellable>()
    private var detailDataService: NewsDetailDataService
    
    
    init(item: NewsItemModel) {
        self.detailDataService = NewsDetailDataService(id: item.id)
        addSuscribers()
    }
    
    private func addSuscribers() {
        detailDataService
            .$newsItem
            .sink { [weak self] item in
                guard let self = self else { return }
                self.newsItem = item
            }
            .store(in: &subscription)
    }
    
    
}
