//
//  NewsTabView.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/08/24.
//

import SwiftUI

struct NewsTabView: View {
    
    @StateObject private var vm: NewsTabViewModel
    @State private var selectedNewsItem: NewsItemModel? = nil
    @State private var showDetailView: Bool = false
    
    init() {
        _vm = StateObject(wrappedValue: NewsTabViewModel())
    }
    
    var body: some View {
        if #available(iOS 16.0, *) {
            NavigationStack {
                VStack{
                    header
                    SearchBarView(searchedText: $vm.searchedText)
                    content
                }
                .ignoresSafeArea(edges: .top)
                .background {
                    NavigationLink(
                        destination: NewsDetailTempView(newsItem: selectedNewsItem),
                        isActive: $showDetailView,
                        label: {
                            EmptyView()
                        })
                }
            }
        } else {
            // Fallback on earlier versions
        }
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
            LazyVStack {
                ForEach(vm.newsItems){ newsItem in
                    NewsItemRowView(newsItem: newsItem)
                        .onAppear {
                            if vm.isToLoadMore(id: newsItem.id) {
                                vm.loadMore()
                            }
                        }
                        .onTapGesture {
                            selectedNewsItem = newsItem
                            showDetailView.toggle()
                        }
                    Divider()
                }
                if vm.isDataLoading {
                    HStack {
                        ProgressView()
                            .tint(Color.theme.accent)
                    }
                    .frame(height: 50)
                }
            }
            .padding(.horizontal,5)
        }
    }
}
