//
//  NewsTabView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/08/24.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject private var vm: NewsTabViewModel
    
    init() {
        _vm = StateObject(wrappedValue: NewsTabViewModel())
    }
    
    var body: some View {
        VStack {
            header
            content
        }
        .ignoresSafeArea()
    }
}

#Preview {
    NewsTabView()
}

extension NewsTabView {
    private var header: some View {
        HStack {
            Text("News")
                .font(.title.bold())
                .foregroundStyle(Color.theme.accent)
                .padding(.bottom,10)
        }
        .padding(.top,50)
        .frame(maxWidth: .infinity)
        .background{
            Color.gray.opacity(0.4)
        }
    }
    
    private var content: some View {
        ScrollView {
            VStack {
                ForEach(vm.newsItems){ newsItem in
                    NewsItemRowView(newsItem: newsItem)
                    Divider()
                }
            }
            .padding(.horizontal,5)
        }
    }
}
