//
//  Tabbar.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 13/08/24.
//

import SwiftUI

struct Tabbar: View {
    @Binding var selectedTab: Int
    var tabItems = [
        TabbarItemModel(tabname: "Home", imagename: "house"),
        TabbarItemModel(tabname: "News", imagename: "newspaper"),
        TabbarItemModel(tabname: "Portfolio", imagename: "suitcase"),
        TabbarItemModel(tabname: "Profile", imagename: "person.crop.circle")
    ]
    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .bottom){
                ForEach(Array(tabItems.enumerated()),id: \.element) { (index,tab) in
                    VStack {
                        Image(systemName: tab.imagename)
                            .resizable()
                            .frame(width: 20,height: 20)
                            .scaleEffect(selectedTab == index ? 1.25 : 1)
                            .onTapGesture {
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    selectedTab = index
                                }
                            }
                        Text(tab.tabname)
                    }
                    .foregroundColor(selectedTab == index ? Color.cyan : Color(uiColor: UIColor(named: "tabbarUnselectedColor")!))
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom,20)
        }
    }
}
