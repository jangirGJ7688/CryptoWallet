//
//  StringExtension.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 11/08/24.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "",options: .regularExpression,range: nil)
    }
    
    var attributedHtmlString: NSAttributedString? {
         try? NSAttributedString(
             data: Data(utf8),
             options: [
                 .documentType: NSAttributedString.DocumentType.html,
                 .characterEncoding: String.Encoding.utf8.rawValue
             ],
             documentAttributes: nil
         )
     }
}
