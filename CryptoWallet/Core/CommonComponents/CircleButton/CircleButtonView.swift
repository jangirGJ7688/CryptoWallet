//
//  CircleButtonView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/06/24.
//

import SwiftUI

struct CircleButtonView: View {
    let buttonIconName: String
    var body: some View {
        Image(systemName: buttonIconName)
            .font(.headline)
            .foregroundColor(Color.theme.accent)
            .frame(width: 50,height: 50)
            .background{
                Circle()
                    .foregroundColor(Color.theme.background)
            }
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10,x: 0,y: 0)
            .padding()
    }
}
