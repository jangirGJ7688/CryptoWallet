//
//  AuthDataResultModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 31/08/24.
//

import Foundation
import FirebaseCore

struct AuthDataResultModel {
    let uid: String
    let userName: String
    let userEmail: String
    let password: String
    let dateOfBirth: Timestamp
    
    init(id: String, userModel: SignUPModel) {
        self.uid = id
        self.userName = userModel.username
        self.userEmail = userModel.usermail
        self.password = userModel.password
        self.dateOfBirth = Timestamp(date: userModel.dateOfBirth)
    }
}
