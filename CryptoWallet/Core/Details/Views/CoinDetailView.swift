//
//  CoinDetailView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 09/08/24.
//

import SwiftUI

struct CoinDetailView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let detailCoin = coin {
                DetailView(coin: detailCoin)
            }
        }
    }
}

#Preview {
//    CoinDetailView(coin: .constant(Dev.getDevCoinModel()))
    NavigationView {
        DetailView(coin: Dev.getDevCoinModel())
    }
}

struct DetailView: View {
    
    @StateObject private var vm: CoinDetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private var spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: CoinDetailViewModel(coin: coin))
    }
    var body: some View {
        ScrollView {
            VStack {
                Text("")
                    .frame(height: 150)
                titleView("Overview")
                Divider()
                lazyGridView(vm.overviewStats)
                titleView("Additional Details")
                Divider()
                lazyGridView(vm.addtionalStats)
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
    }
}


extension DetailView {
    private func titleView(_ title: String) -> some View {
        Text(title)
            .font(.title.bold())
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private func lazyGridView(_ stats: [HomeStatModel]) -> some View {
        LazyVGrid(columns: columns,
                  alignment: .center,
                  spacing: spacing,
                  pinnedViews: [],
                  content: {
            ForEach(stats) { stat in
                StatView(stat: stat)
            }
        })
    }
}
