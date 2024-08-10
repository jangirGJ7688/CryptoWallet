//
//  CoinDetailViewModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 10/08/24.
//

import Foundation
import Combine

class CoinDetailViewModel: ObservableObject {
    
    @Published var coinData: CoinDetailModel?
    @Published var overviewStats: [HomeStatModel] = []
    @Published var addtionalStats: [HomeStatModel] = []
    
    @Published var coin: CoinModel
    private var detailDataService: CoinDetailDataService
    private var subscription = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.coin = coin
        self.detailDataService = CoinDetailDataService(coinID: coin.id)
        addSubscribers()
    }
    
    func addSubscribers() {
        detailDataService
            .$coinData
            .combineLatest($coin)
            .map(mapDataToStats)
            .sink { [weak self] returnedArrays in
                guard let self = self else { return }
                self.overviewStats = returnedArrays.overviewStats
                self.addtionalStats = returnedArrays.addtionalStats
            }
            .store(in: &subscription)
    }
    
    private func mapDataToStats(coinData: CoinDetailModel?, coinModel: CoinModel) -> (overviewStats: [HomeStatModel], addtionalStats: [HomeStatModel]) {
        
        // Overview Stats
        let overviewStats: [HomeStatModel] = mapOverviewStats(coinModel: coinModel)
        
        // Additional Stats
        let addtionalStats: [HomeStatModel] = mapAdditionalStats(coinData: coinData, coinModel: coinModel)
        
        return (overviewStats,addtionalStats)
    }
    
    private func mapOverviewStats(coinModel: CoinModel) -> [HomeStatModel] {
        let price = coinModel.currentPrice.asCurrencyWith6Decimal()
        let pricePercentageChange = coinModel.priceChangePercentage24H
        let priceStats = HomeStatModel(title: "Current Price", value: price, percentDelta: pricePercentageChange)
        
        let marketCap = "$" + (coinModel.marketCap?.formatWithAbservation() ?? "")
        let marketCapPercentageChange = coinModel.marketCapChangePercentage24H
        let marketStats = HomeStatModel(title: "Market Capitalization", value: marketCap, percentDelta: marketCapPercentageChange)
        
        let rankStats = HomeStatModel(title: "Rank", value: "\(coinModel.rank)")
        
        let volume = "$" + (coinModel.totalVolume?.formatWithAbservation() ?? "")
        let volumeStats = HomeStatModel(title: "Volume", value: volume)
        
        return [priceStats, marketStats, rankStats, volumeStats]
    }
    
    private func mapAdditionalStats(coinData: CoinDetailModel?, coinModel: CoinModel) -> [HomeStatModel] {
        let high = coinModel.high24H?.asCurrencyWith6Decimal() ?? "N/A"
        let highStats = HomeStatModel(title: "24H High", value: high)
        
        let low = coinModel.low24H?.asCurrencyWith6Decimal() ?? "N/A"
        let lowStats = HomeStatModel(title: "24H Low", value: low)
        
        let priceChange = coinModel.priceChange24H?.asCurrencyWith6Decimal() ?? "N/A"
        let pricePercentageChange = coinModel.priceChangePercentage24H
        let priceChangeStats = HomeStatModel(title: "24H Price Change", value: priceChange,percentDelta: pricePercentageChange)
        
        let marketCapChange = "$" + (coinModel.marketCapChange24H?.formatWithAbservation() ?? "")
        let marketCapPercentageChange = coinModel.marketCapChangePercentage24H
        let marketCapChangeStats = HomeStatModel(title: "24H Market Cap Change", value: marketCapChange, percentDelta: marketCapPercentageChange)
        
        let blockTime = coinData?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "N/A" : "\(blockTime)"
        let blockTimeStats = HomeStatModel(title: "Block Time", value: blockTimeString)
        
        let hashingAlgorithm = coinData?.hashingAlgorithm ?? "N/A"
        let hashingAlgorithmStats = HomeStatModel(title: "Hashing Algorithm", value: hashingAlgorithm)
        
        return [highStats, lowStats, priceChangeStats, marketCapChangeStats, blockTimeStats, hashingAlgorithmStats]
    }
}
