//
//  TabbarView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 13/08/24.
//

import SwiftUI

struct TabbarView: View {
    @State var selectedTab = 0
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "tabbarBackgroundColor")
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                TabView(selection: $selectedTab) {
                    HomeView()
                        .tag(0)
                        .navigationBarHidden(true)
                    NewsTabView()
                        .tag(1)
                    PortfolioTabView()
                        .tag(2)
                    ProfileTabView()
                        .tag(3)
                }
            }
            VStack {
                Spacer()
                Tabbar(selectedTab: $selectedTab)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    TabbarView()
        .environmentObject(HomeViewModel())
}
