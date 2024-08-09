//
//  ColorExtension.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/06/24.
//

import Foundation
import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("IndicatorUpColor")
    let red = Color("IndicatorDownColor")
    let secondaryText = Color("SecondaryTextColor")
}
