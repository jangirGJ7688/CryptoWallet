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
        .background {
            Color.theme.background.opacity(0.000001)
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
            AsyncImageView(urlSting: coinModel.image, size: CGSize(width: 30, height: 30))
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

