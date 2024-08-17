//
//  PortfolioTabView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 13/08/24.
//

import SwiftUI

struct PortfolioTabView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    @State private var showPortfolioView = false
    
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            VStack {
                Header
                Content
            }
        }
        .ignoresSafeArea(edges:.top)
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
    PortfolioTabView()
        .environmentObject(HomeViewModel())
}

extension PortfolioTabView {
    private var Header: some View {
        VStack {
            HStack {
                HStack {
                    Image("headerLogo")
                        .resizable()
                        .frame(width: 17,height: 26)
                }
                .frame(width: 50,height: 50)
                .padding()
                Spacer()
                Text("PORTFOLIO")
                    .font(.title3.bold())
                Spacer()
                CircleButtonView(buttonIconName: "plus")
                    .animation(.none)
                    .background(CircleButtonAnimationView(animate: $showPortfolioView))
                    .onTapGesture {
                        showPortfolioView.toggle()
                    }
            }
            .padding(.horizontal)
            SearchBarView(searchedText: $vm.searchedText)
        }
        .padding(EdgeInsets(top: 40, leading: 0, bottom: 20, trailing: 0))
        .background {
            Color("headerBackground")
        }
    }
    
    private var Content: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                PortfolioRowView(coin: coin)
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        selectedCoin = coin
                        showDetailView.toggle()
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
}
