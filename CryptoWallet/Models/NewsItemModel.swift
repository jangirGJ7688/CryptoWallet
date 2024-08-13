//
//  NewsItemModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 12/08/24.
//

import Foundation

struct NewsModel: Decodable {
    let result: [NewsItemModel]
}


struct NewsItemModel: Decodable, Identifiable {
    let id: String
    let searchKeyWords: [String]?
    let feedDate: Int
    let source, title: String
    let isFeatured: Bool?
    let imgUrl: String
    let shareURL: String?
    let relatedCoins: [String]?
    let link: String?
    
    
    func getTimeLapse() -> String {
        let timeStampInSeconds = TimeInterval(self.feedDate/1000)
        let feedDate = Date(timeIntervalSince1970: timeStampInSeconds)
        let todaysDate = Date()
        let dateDifference = todaysDate.timeIntervalSinceReferenceDate - feedDate.timeIntervalSinceReferenceDate
        if dateDifference >= 6*24*60*60 {
            return feedDate.asShortDateString()
        }
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        let relativeDate = formatter.localizedString(for: feedDate, relativeTo: todaysDate)
        return relativeDate
    }
    
}
