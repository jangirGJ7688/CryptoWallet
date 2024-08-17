//
//  PortfolioView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 20/06/24.
//

import SwiftUI

struct PortfolioView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject private var vm: HomeViewModel
    @State private var selectedCoin: CoinModel? = nil
    @State private var quantity: String = ""
    @State private var showCheckMark = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading,spacing: 0) {
                    SearchBarView(searchedText: $vm.searchedText)
                    coinHorizontalListView
                    if selectedCoin != nil {
                        purchaseView
                    }
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(presentationMode: presentationMode)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    trailingNavBarTool
                }
            })
            .onChange(of: vm.searchedText, perform: { value in
                if value == "" {
                    removeSelectedCoin()
                }
            })
            
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(HomeViewModel())
}

extension PortfolioView {
    
    private func updateSelectedCoin(coin: CoinModel) {
        selectedCoin = coin
        
        if let portfolioCoin = vm.portfolioCoins.first(where: { $0.id == coin.id }), let amount = portfolioCoin.currentHoldings {
            quantity = "\(amount)"
        }else {
            quantity = ""
        }
    }
    
    private func getTotalPrice() -> Double {
        if let quant = Double(quantity) {
            return quant*(selectedCoin?.currentPrice ?? 0.0)
        }
        return 0.0
    }
    
    private var coinHorizontalListView: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.searchedText.isEmpty ? vm.portfolioCoins : vm.allCoins){ coin in
                    CoinCollectionView(coin: coin)
                        .frame(width: 75)
                        .padding(4)
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                updateSelectedCoin(coin: coin)
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10.0)
                                .stroke(selectedCoin?.id == coin.id ?
                                        Color.theme.green : Color.clear, lineWidth: 1.0)
                        )
                }
            }
            .padding(.vertical,4)
            .padding(.leading)
        }
    }
    
    private var purchaseView: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Current price of \(selectedCoin?.symbol.uppercased() ?? ""):")
                    .foregroundColor(Color.theme.accent)
                Spacer()
                Text(selectedCoin?.currentPrice.asCurrencyWith6Decimal() ?? "")
                    .foregroundColor(Color.theme.accent)
            }
            Divider()
                .foregroundColor(Color.theme.accent)
            HStack {
                Text("Amount holding:")
                Spacer()
                TextField(selectedCoin != nil && (selectedCoin?.currentHoldings ?? 0) > 0 ? "\(selectedCoin?.currentHoldings ?? 0)" : "Ex: 2.5", text: $quantity)
                    .multilineTextAlignment(.trailing)
                    .keyboardType(.decimalPad)
            }
            Divider()
                .foregroundColor(Color.theme.accent)
            HStack {
                Text("Total Value:")
                Spacer()
                Text(getTotalPrice().asCurrencyWith2Decimals())
            }
        }
        .animation(.none)
        .padding()
        .font(.headline)
    }
    
    private var trailingNavBarTool: some View {
        HStack(spacing: 5) {
            Image(systemName: "checkmark")
                .opacity(showCheckMark ? 1.0 : 0.0)
            Button(action: {
                saveBtnClick()
            }, label: {
                Text("Save".uppercased())
            })
            .opacity(
                selectedCoin != nil &&
                selectedCoin?.currentHoldingValue != Double(quantity)
                ? 1.0 : 0.0)
        }
        .font(.headline)
    }
    
    private func saveBtnClick() {
        guard let choosenCoin = selectedCoin, let amount = Double(quantity) else { return }
        vm.updatePortfolioCoin(coin: choosenCoin, amount: amount)
        
        withAnimation(.easeIn) {
            showCheckMark = true
            removeSelectedCoin()
        }
        
        UIApplication.shared.endEditing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                showCheckMark = false
            }
        }
    }
    
    private func removeSelectedCoin() {
        selectedCoin = nil
        vm.searchedText = ""
    }
}
