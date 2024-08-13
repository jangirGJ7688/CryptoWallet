//
//  NewsItemRowView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/08/24.
//

import SwiftUI

struct NewsItemRowView: View {
    
    let newsItem: NewsItemModel
    
    init(newsItem: NewsItemModel) {
        self.newsItem = newsItem
    }
    
    var body: some View {
        HStack {
            AsyncImageView(urlSting: newsItem.imgUrl, size: CGSize(width: 100, height: 100))
                .cornerRadius(10)
            VStack(alignment: .leading){
                Text(newsItem.title)
                    .lineLimit(3)
                    .foregroundStyle(Color.theme.accent)
                    .font(.subheadline)
                    .padding(.bottom,2)
                Text(newsItem.getTimeLapse())
                    .font(.caption)
                    .foregroundStyle(Color.theme.secondaryText)
                Spacer()
            }
            .padding(.vertical,2)
            Spacer()
        }
    }
}

#Preview {
    NewsItemRowView(newsItem: Dev.getNewsItem())
        .frame(height: 100)
}
