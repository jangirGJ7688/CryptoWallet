//
//  AsyncImageView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 20/06/24.
//

import SwiftUI

struct AsyncImageView: View {
    let urlSting: String
    let size: CGSize
    
    init(urlSting: String, size: CGSize) {
        self.urlSting = urlSting
        self.size = size
    }
    
    var body: some View {
        AsyncImage(url: URL(string: urlSting)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(width: size.width,height: size.height)
            }else if phase.error != nil {
                Image(uiImage: UIImage(named: "iconPlaceholder")!)
                    .resizable()
                    .frame(width: size.width,height: size.height)
            }else {
                ProgressView()
                    .frame(width: size.width,height: size.height)
            }
        }
    }
}
//
//#Preview {
//    AsyncImageView()
//}
