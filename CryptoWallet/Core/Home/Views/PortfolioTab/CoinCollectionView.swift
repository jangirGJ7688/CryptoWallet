//
//  CoinCollectionView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 20/06/24.
//

import SwiftUI

struct CoinCollectionView: View {
    let coin: CoinModel
    var body: some View {
        VStack {
            AsyncImageView(urlSting: coin.image, size: CGSize(width: 30, height: 30))
                .frame(width: 50,height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    CoinCollectionView(coin: Dev.getDevCoinModel())
}
