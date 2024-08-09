//
//  CurrencyRowView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 14/06/24.
//

import SwiftUI

struct CurrencyRowView: View {
    
    let coinModel: CoinModel
    
    var body: some View {
        HStack {
            leftView
            Spacer()
            rightView
        }
    }
}

#Preview {
    CurrencyRowView(coinModel: Dev.getDevCoinModel())
}

extension CurrencyRowView {
    private var leftView: some View {
        HStack(spacing: 0) {
            Text("\(coinModel.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            AsyncImageView(urlSting: coinModel.image)
            VStack(alignment: .leading) {
                Text(coinModel.name)
                    .font(.headline)
                    .foregroundColor(Color.theme.accent)
                Text(coinModel.symbol.uppercased())
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryText)
            }
            .padding(.leading,10)
        }
    }
    
    private var rightView: some View {
        HStack(spacing: 0) {
            VStack(alignment: .trailing) {
                Text(coinModel.currentPrice.asCurrencyWith6Decimal())
                    .bold()
                    .foregroundColor(Color.theme.accent)
                Text(abs(coinModel.priceChange24H ?? 0).asPercentString())
                    .font(.caption)
                    .foregroundColor((coinModel.priceChange24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            }
        }
    }
}


struct Dev {
    static func getDevCoinModel() -> CoinModel {
        return CoinModel(id: "bitcoin", symbol: "BTC", name: "Bitcoin", image: "https://static.coinstats.app/coins/1650455588819.png", currentPrice: 12345.664234532, marketCap: 1317102631926.7954, marketCapRank: 1, fullyDilutedValuation: 1474623675796, totalVolume: 20154184933, high24H: 70215, low24H: 68060, priceChange24H: 2126.88, priceChangePercentage24H: 3.12502, marketCapChange24H: 44287678051, marketCapChangePercentage24H: 3.31157, circulatingSupply: 19675987, totalSupply: 21000000, maxSupply: 21000000, ath: 73738, athChangePercentage: -4.77063, athDate: "2024-03-14T07:10:36.635Z", atl: 67.81, atlChangePercentage: 103455.83335, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2024-04-07T16:49:31.736Z", sparklineIn7Days: nil, priceChangePercentage24HInCurrency: 7.030615246182169, currentHoldings: 1)
    }
}

