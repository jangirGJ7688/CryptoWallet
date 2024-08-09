//
//  AsyncImageView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 20/06/24.
//

import SwiftUI

struct AsyncImageView: View {
    var urlSting: String?
    var body: some View {
        AsyncImage(url: URL(string: urlSting ?? "")) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(width: 30,height: 30)
            }else if phase.error != nil {
                Image(uiImage: UIImage(named: "iconPlaceholder")!)
                    .resizable()
                    .frame(width: 30,height: 30)
            }else {
                ProgressView()
            }
        }
    }
}

#Preview {
    AsyncImageView()
}
