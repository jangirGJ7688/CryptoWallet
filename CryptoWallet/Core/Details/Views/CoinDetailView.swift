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
    NavigationView {
        DetailView(coin: Dev.getDevCoinModel())
    }
}

struct DetailView: View {
    
    @StateObject private var vm: CoinDetailViewModel
    @State private var readMoreExpended: Bool = false
    
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
                ChartView(coin: vm.coin)
                    .frame(height: 200)
            }
            .padding(.vertical)
            .padding(.horizontal,8)
            VStack(spacing: 20) {
                titleView("Overview")
                Divider()
                descriptionView
                lazyGridView(vm.overviewStats)
                titleView("Additional Details")
                Divider()
                lazyGridView(vm.addtionalStats)
                linksView
            }
            .padding()
        }
        .navigationTitle(vm.coin.name)
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                navBarTrailingToolItem
            }
        })
    }
}


extension DetailView {
    
    private var navBarTrailingToolItem: some View {
        HStack {
            Text(vm.coin.symbol.uppercased())
                .font(.headline.bold())
                .foregroundStyle(Color.theme.secondaryText)
            AsyncImageView(urlSting: vm.coin.image, size: CGSize(width: 25, height: 25))
        }
    }
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
    
    private var descriptionView: some View {
        ZStack {
            if let desc = vm.coinDescription, !desc.isEmpty {
                VStack(alignment: .leading) {
                    Text(desc.removingHTMLOccurances)
                        .lineLimit(readMoreExpended ? nil : 4)
                        .foregroundStyle(Color.accent.opacity(0.7))
                    Button {
                        withAnimation(.easeInOut) {
                            readMoreExpended.toggle()
                        }
                    } label: {
                        Text(readMoreExpended ? "Read Less" : "Read More")
                            .accentColor(.blue)
                            .font(.caption.bold())
                            .padding(.vertical,2)
                    }

                }
            }
        }
    }
    
    private var linksView: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let webURLString = vm.webURLString, let webURL = URL(string: webURLString) {
                Link("Official Website", destination: webURL)
            }
            if let redditURLString = vm.redditURLString, let redditURL = URL(string: redditURLString) {
                Link("Reddit Website", destination: redditURL)
            }
        }
        .accentColor(.blue)
        .frame(maxWidth: .infinity,alignment: .leading)
        .font(.headline)
    }
}
