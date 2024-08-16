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
        if #available(iOS 16.0, *) {
            NavigationStack {
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
        } else {
            Text("Please update your ios version")
        }
    }
}

#Preview {
    TabbarView()
        .environmentObject(HomeViewModel())
}
