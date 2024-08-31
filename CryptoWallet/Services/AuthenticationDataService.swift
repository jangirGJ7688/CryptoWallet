//
//  AuthenticationDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 24/08/24.
//

import Foundation
import FirebaseAuth
import FirebaseCore

final class AuthenticationDataService {
    
    static let shared = AuthenticationDataService()
    private init() {}
    
    var showLoader = false
    
    func getAuthenticatedUser() throws -> String {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return user.uid
    }
    
    func createUser(with credentials: SignUPModel) async throws {
        let authDataResult = try await Auth.auth().createUser(withEmail: credentials.usermail, password: credentials.password)
        let user = UserModel(id: authDataResult.user.uid, name: credentials.username, email: credentials.usermail, dateOfBirth: credentials.dateOfBirth)
        try await UserManager.shared.createNewUser(user: user)
        UserDefaults.standard.set(true, forKey: AppConstants.isUserLogined)
        UserDefaults.standard.set(true, forKey: AppConstants.isShowSignIn)
    }
    
    func signInExistingUser(with credentials: SignInModel) async throws {
        try await Auth.auth().signIn(withEmail: credentials.email, password: credentials.password)
        UserDefaults.standard.set(true, forKey: AppConstants.isUserLogined)
        UserDefaults.standard.set(true, forKey: AppConstants.isShowSignIn)
    }
    
    func signOut() async throws {
        try Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: AppConstants.isUserLogined)
        UserDefaults.standard.set(true, forKey: AppConstants.isShowSignIn)
    }
}
