//
//  CryptoWalletApp.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/06/24.
//

import SwiftUI
import Firebase

@main
struct CryptoWalletApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }

    var body: some Scene {
        WindowGroup {
            SessionView()
                .environmentObject(vm)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        if UserDefaults.standard.value(forKey: AppConstants.isUserLogined) == nil {
            UserDefaults.standard.set(false, forKey: AppConstants.isUserLogined)
        }
        if UserDefaults.standard.value(forKey: AppConstants.isShowSignIn) == nil {
            UserDefaults.standard.set(false, forKey: AppConstants.isShowSignIn)
        }
        return true
    }
}
