//
//  UserManager.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 27/08/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

final class UserManager {
    
    static let shared = UserManager()
    private init() {}
    
    private let userCollection = Firestore.firestore().collection("users")
    
    private let encoder: Firestore.Encoder = {
        let encoder = Firestore.Encoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    
    private let decoder: Firestore.Decoder = {
        let decoder = Firestore.Decoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    
    func userDocument(userId: String) -> DocumentReference {
        return userCollection.document(userId)
    }
    
    func createNewUser(user: UserModel) async throws {
        try userDocument(userId: user.id).setData(from: user, merge: false, encoder: encoder)
    }
    
    func getUser() async throws -> UserModel {
        let userId = try AuthenticationDataService.shared.getAuthenticatedUser()
        let user = try await userDocument(userId: userId).getDocument(as: UserModel.self,decoder: decoder)
        return user
    }
    
}
