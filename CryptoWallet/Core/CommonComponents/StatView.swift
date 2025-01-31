//
//  StatView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 19/06/24.
//

import SwiftUI

struct StatView: View {
    let stat: HomeStatModel
    var body: some View {
        VStack(alignment: .center,spacing: 4){
            Text(stat.title)
                .foregroundColor(Color.theme.secondaryText)
                .font(.caption)
            Text(stat.value)
                .foregroundColor(Color.theme.accent)
                .font(.headline)
            HStack(spacing: 4) {
                Text(abs(stat.percentDelta ?? 0.0).asPercentString())
                Image((stat.percentDelta ?? 0) >= 0 ? "upIndicator" : "downIndicator")
                    .renderingMode(.template)
            }
            .font(.caption)
            .foregroundColor((stat.percentDelta ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentDelta == nil ? 0 : 1.0)
        }
    }
}

#Preview {
    StatView(stat: HomeStatModel(title: "Market Data", value: "$ 12.5Tr", percentDelta: 3.4))
}
