//
//  SearchBarView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/06/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchedText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchedText.isEmpty ? Color.secondaryText : Color.theme.accent)
            TextField("Search by name or symbol... ", text: $searchedText)
                .foregroundColor(Color.theme.accent)
                .autocorrectionDisabled()
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10.0)
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchedText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchedText = ""
                        }
                    ,alignment: .trailing
                )
        }
        .font(.headline)
        .padding()
        .overlay(Color.gray, in: RoundedRectangle(cornerRadius: 16.0).stroke(lineWidth: 1.0))
        .padding()
    }
}

#Preview {
    SearchBarView(searchedText: .constant(""))
}
