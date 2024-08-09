//
//  UIApplication.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 19/06/24.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
