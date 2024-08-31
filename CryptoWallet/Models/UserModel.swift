//
//  UserModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 31/08/24.
//

import Foundation

struct UserModel: Codable{
    let id: String
    let name: String
    let email: String
    let dateOfBirth: Date
}
