//
//  HepticManager.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 21/06/24.
//

import UIKit


class HepticManager {
    
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
    
}
