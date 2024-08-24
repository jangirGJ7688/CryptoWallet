//
//  AppStateView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/08/24.
//

import SwiftUI

struct AppStateView: View {
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                if let isLogined = UserDefaults.standard.value(forKey: "ISUSERLOGINED") as? Bool, isLogined == true {
                    TabbarView()
                }else {
                    SignUPView(userModel: .constant(SignUPModel(username: "", usermail: "", dateOfBirth: Date(), password: "")))
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
}

#Preview {
    AppStateView()
}
