//
//  CryptoWalletApp.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/06/24.
//

import SwiftUI

@main
struct CryptoWalletApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
