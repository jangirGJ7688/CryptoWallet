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
            VStack{
                Header
                Content
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
}

#Preview {
    NewsTabView()
}

extension NewsTabView {
    private var Header: some View {
        VStack {
            HStack {
                HStack {
                    Image("headerLogo")
                        .resizable()
                        .frame(width: 17,height: 26)
                }
                .frame(width: 50,height: 50)
                .padding()
                Spacer()
                Text("NEWS")
                    .font(.title3.bold())
                Spacer()
                Image("home")
                    .frame(width: 50,height: 50)
                    .padding()
            }
            .padding(.horizontal)
            SearchBarView(searchedText: $vm.searchedText)
        }
        .padding(EdgeInsets(top: 30, leading: 0, bottom: 20, trailing: 0))
        .background {
            Color("headerBackground")
        }
    }
    
    private var Content: some View {
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
            .padding(.horizontal,10)
        }
    }
}
