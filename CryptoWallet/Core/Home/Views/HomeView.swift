//
//  HomeView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/06/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio = false
    @State private var showPortfolioView = false
    @EnvironmentObject private var vm: HomeViewModel
    
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            VStack {
                HeaderView
                HomeStatView(statData: vm.homeStatData, showPortfolio: $showPortfolio)
                SearchBarView(searchedText: $vm.searchedText)
                if !showPortfolio {
                    listHeader
                    allCoinsList
                        .transition(.move(edge: .leading))
                        .refreshable {
                            vm.reloadData()
                        }
                }else {
                    portfolioList
                        .transition(.move(edge: .trailing))
                        .refreshable {
                            vm.reloadData()
                        }
                }
                Spacer(minLength: 0)
            }
        }
        .background {
            NavigationLink(
                destination: CoinDetailView(coin: $selectedCoin),
                isActive: $showDetailView,
                label: {
                    EmptyView()
                })
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
}

extension HomeView {
    private var HeaderView: some View {
        HStack {
            CircleButtonView(buttonIconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(CircleButtonAnimationView(animate: $showPortfolio))
                .onTapGesture {
                    if showPortfolio {
                        showPortfolioView.toggle()
                    }
                }
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(.none)
            Spacer()
            CircleButtonView(buttonIconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CurrencyRowView(coinModel: coin)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var portfolioList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                PortfolioRowView(coin: coin)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var listHeader: some View {
        HStack {
            HStack {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            Spacer()
            HStack {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            Button(action: {
                withAnimation(.linear(duration: 2.0)) {
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0),anchor: .center)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal,50)
    }
}

extension HomeView {
    private func segue(coin: CoinModel) {
        selectedCoin = coin
        showDetailView.toggle()
    }
}
