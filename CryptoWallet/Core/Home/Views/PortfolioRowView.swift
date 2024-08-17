//
//  PortfolioRowView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 20/06/24.
//

import SwiftUI

struct PortfolioRowView: View {
    
    let coin: CoinModel
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            coinPortfolioView
            bottomView
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16.0)
                .foregroundColor(Color("PortfolioRowColor"))
                .opacity(0.5)
                .shadow(color: Color.theme.accent.opacity(0.8), radius: 5)
        )
    }
}

#Preview {
    PortfolioRowView(coin: Dev.getDevCoinModel())
}

extension PortfolioRowView {
    
    private var coinPortfolioView: some View {
        HStack {
            AsyncImageView(urlSting: coin.image, size: CGSize(width: 30, height: 30))
            Spacer()
            Text(coin.name)
            Spacer()
            Text(coin.symbol.uppercased())
        }
        .padding(.horizontal)
        .font(.headline)
        .foregroundColor(Color.theme.accent)
    }
    
    private var currentPriceView: some View {
        VStack(spacing: 10) {
            Text("Current Price")
                .font(.caption)
            Text(coin.currentPrice.asCurrencyWith6Decimal())
                .font(.headline)
            HStack {
                Text(abs(coin.priceChangePercentage24H ?? 0.0).asPercentString())
                Image((coin.priceChangePercentage24H ?? 0) >= 0 ? "upIndicator" : "downIndicator")
                    .renderingMode(.template)
            }
            .font(.caption)
            .foregroundColor((coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(coin.priceChangePercentage24H == nil ? 0 : 1.0)
        }
    }
    
    private var currentHoldingView: some View {
        VStack(spacing: 10) {
            Text("Current Holding")
                .font(.caption)
            Text(coin.currentHoldingValue.asCurrencyWith2Decimals())
                .font(.headline)
            Text(coin.currentHoldings?.asNumberString() ?? "")
        }
    }
    
    private var bottomView: some View {
        HStack {
            currentPriceView
            Spacer()
            currentHoldingView
        }
    }
    
}
