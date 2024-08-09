//
//  CircleButtonAnimationView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 13/06/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeIn(duration: 1) : .none)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(true))
        .foregroundStyle(.red)
        .frame(width: 100,height: 100)
}
