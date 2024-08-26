//
//  AppStateView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/08/24.
//

import SwiftUI

struct SessionView: View {
    
    @AppStorage(AppConstants.isUserLogined) var isUserLogined: Bool = UserDefaults.standard.bool(forKey: AppConstants.isUserLogined)
    @AppStorage(AppConstants.isShowSignIn) var isShowSignIn: Bool = UserDefaults.standard.bool(forKey: AppConstants.isShowSignIn)
    
    var body: some View {
        if #available(iOS 16.0, *) {
            ZStack {
                if isUserLogined {
                    TabbarView()
                } else {
                    if isShowSignIn {
                        SignInView()
                    }else {
                        SignUPView()
                    }
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    SessionView()
}
