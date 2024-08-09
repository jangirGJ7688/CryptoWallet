//
//  HomeViewModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 15/06/24.
//

import Combine
import UIKit

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var homeStatData: [HomeStatModel] = []
    @Published var isLoading: Bool = false
    @Published var searchedText: String = ""
    @Published var sortOption: SortOption = SortOption.rank
    
    private let dataService =  CoinDataService()
    private var subscription = Set<AnyCancellable>()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    
    enum SortOption {
        case rank, rankReversed, price, priceReversed
    }
    
    init() {
        addSubscribers()
//        setTimerForReloading()
    }
    
    func addSubscribers() {
        $searchedText
            .combineLatest(dataService.$allCoins, $sortOption)
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .map(filterAndSortCoin)
            .sink { [weak self] filteredResults in
                self?.allCoins = filteredResults
            }
            .store(in: &subscription)
        
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map { (coinModels,portfolioEntities) -> [CoinModel] in
                coinModels
                    .compactMap { coin -> CoinModel? in
                        guard let entity = portfolioEntities.first(where: { $0.coinId == coin.id }) else { return nil }
                        return coin.updateHolding(amount: entity.amount)
                    }
            }
            .sink { [weak self] portfolioCoins in
                guard let self = self else { return }
                self.portfolioCoins = portfolioCoins
            }
            .store(in: &subscription)
        
        marketDataService
            .$statData
            .combineLatest($portfolioCoins)
            .map(getPortfolioValue)
            .sink { [weak self] marketData in
                guard let self = self else { return }
                self.homeStatData = self.setMarketData(adata: marketData)
                self.isLoading = false
            }
            .store(in: &subscription)
        
    }
    
    private func getPortfolioValue(statData: MarketDataModel?, portCoins: [CoinModel]) -> (Double,Double,MarketDataModel?) {
        let portfolioValue =
        portCoins
            .map({$0.currentHoldingValue})
            .reduce(0, +)
        let previousValue =
        portCoins
            .map { (coin) -> Double in
                if let delta24H = coin.priceChange24H {
                    let currentPrice = coin.currentHoldingValue
                    let percentChange = delta24H/100
                    let previousVal = currentPrice/(1+percentChange)
                    return previousVal
                }
                return 0
            }
            .reduce(0, +)
        let percentChange24H = ((portfolioValue - previousValue)/previousValue)*100
        return (portfolioValue,percentChange24H,statData)
    }
    
    private func setMarketData(adata: (Double,Double,MarketDataModel?)) -> [HomeStatModel] {
        guard let data = adata.2 else { return [] }
        return [
            HomeStatModel(title: "Market Data", value: "$" + data.marketCap, percentDelta: data.marketCapChangePercentage24H),
            HomeStatModel(title: "24H Volume", value: "$" + data.volume),
            HomeStatModel(title: "BTC Dominence", value: "$" + data.btcDominace),
            HomeStatModel(title: "Portfolio Value", value: "$" + adata.0.formatWithAbservation(),percentDelta: adata.1)
        ]
    }
    
    private func filterCoin(text: String, allCoins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else { return allCoins }
        return allCoins.filter { coin in
            return coin.name.lowercased().contains(text.lowercased())
            || coin.symbol.lowercased().contains(text.lowercased())
            || coin.id.lowercased().contains(text.lowercased())
        }
    }
    
    private func filterAndSortCoin(text: String, allCoins: [CoinModel], sortOption: SortOption) -> [CoinModel] {
        var updatedCoins = filterCoin(text: text, allCoins: allCoins)
        sortCoins(sort: sortOption, coins: &updatedCoins)
        return updatedCoins
    }
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel]) {
        switch sort {
        case .price:
            coins.sort(by: { $0.currentPrice < $1.currentPrice })
        case.priceReversed:
            coins.sort(by: { $0.currentPrice > $1.currentPrice })
        case .rank:
            coins.sort(by: { $0.rank < $1.rank })
        case .rankReversed:
            coins.sort(by: { $0.rank > $1.rank })
        }
    }
    
    private func setTimerForReloading() {
        Timer
            .publish(every: 60, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                self.autoReload()
            }
            .store(in: &subscription)
    }
    
    private func autoReload() {
        debugPrint("Ganpat Home Data is Reloading...")
        dataService.getCoins()
        marketDataService.getMarketData()
    }
    
    func reloadData() {
        self.isLoading = true
        autoReload()
        HepticManager.notification(type: .success)
    }
    
    func updatePortfolioCoin(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
}
