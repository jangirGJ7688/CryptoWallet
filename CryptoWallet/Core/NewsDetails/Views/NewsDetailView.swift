//
//  NewsDetailView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 14/08/24.
//

import SwiftUI

struct NewsDetailTempView: View {
    
    var newsItem: NewsItemModel?
    
    var body: some View {
        ZStack {
            if let item = newsItem {
                NewsDetailView(item: item)
            }
        }
    }
}

struct NewsDetailView: View {
    
    @StateObject var vm: NewsDetailViewModel
    
    init(item: NewsItemModel) {
        _vm = StateObject(wrappedValue: NewsDetailViewModel(item: item))
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            imageView
            VStack(alignment: .leading,spacing: 15) {
                title
                timeView
                description
                readMore
            }
            .padding()
        }
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                navBarTrailingToolItem
            }
        })
    }
}

#Preview {
    NavigationView {
        NewsDetailView(item: Dev.getNewsItem())
    }
}

extension NewsDetailView {
    private var imageView: some View {
        AsyncImageView(urlSting: vm.newsItem?.imgUrl ?? "", size: CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*0.7))
    }
    
    private var title: some View {
        VStack {
            Text(vm.newsItem?.title ?? "")
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var timeView: some View {
        HStack  {
            if let item = vm.newsItem {
                Image(systemName: "calendar")
                Text(item.getTimeString())
                Spacer()
            }
        }
        .foregroundStyle(Color.theme.secondaryText)
        .font(.headline)
    }
    
    private var description: some View {
        VStack  {
            if #available(iOS 16.0, *) {
                Text(vm.newsItem?.description?.removingHTMLOccurances ?? "")
                    .font(.callout)
                    .foregroundStyle(Color.theme.accent)
                    .lineSpacing(5.0)
                    .kerning(1.0)
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    private var readMore: some View {
        HStack {
            if let item = vm.newsItem, let webURL = URL(string: item.link) {
                Spacer()
                Link(destination: webURL, label: {
                    Text("Read More")
                        .font(.callout)
                        .foregroundStyle(Color.white)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 20.0)
                                .foregroundColor(Color.cyan)
                        }
                })
                Spacer()
            }
        }
    }
    
    private var navBarTrailingToolItem: some View {
        HStack {
            if let item = vm.newsItem {
                if #available(iOS 16.0, *) {
                    ShareLink(item: item.shareURL) {
                        Image(systemName: "arrowshape.turn.up.forward.circle")
                            .font(.subheadline)
                            .foregroundStyle(Color.theme.accent)
                    }
                } else {
                    // Fallback on earlier versions
                }
            }
        }
    }
}
