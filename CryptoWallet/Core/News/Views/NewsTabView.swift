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
        ScrollView {
            VStack {
                List {
                    ForEach(vm.newsItems){ newsItem in
                        NewsItemRowView(newsItem: newsItem)
                    }
                }
            }
        }
    }
}

#Preview {
    NewsTabView()
}
