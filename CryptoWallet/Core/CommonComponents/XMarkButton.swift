//
//  XMarkButton.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 20/06/24.
//

import SwiftUI

struct XMarkButton: View {
    
    @Binding var presentationMode: PresentationMode
    
    var body: some View {
        Button(action: {
            $presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}
