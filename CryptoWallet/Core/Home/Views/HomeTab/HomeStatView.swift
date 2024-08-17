//
//  HomeStatView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 19/06/24.
//

import SwiftUI

struct HomeStatView: View {
    
    let statData: [HomeStatModel]
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(statData) { data in
                StatView(stat: data)
                    .frame(width: UIScreen.main.bounds.width/3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,alignment:
                showPortfolio ? .trailing : .leading)
    }
}

//#Preview {
//    HomeStatView(showPortfolio: .constant(false))
//}
