//
//  AuthenticationDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 24/08/24.
//

import Foundation
import FirebaseAuth

class AuthenticationDataService: ObservableObject {
    
//    static let shared = AuthenticationDataService()
//    
//    private init() {}
    
    var showLoader = false
    
    func createUser(with credentials: SignUPModel) {
        showLoader = true
        Auth.auth().createUser(withEmail: credentials.usermail, password: credentials.password) { [weak self] result, error in
            if error != nil {
                self?.showLoader = false
                return
            }
            UserDefaults.standard.set(true, forKey: AppConstants.isUserLogined)
            UserDefaults.standard.set(true, forKey: AppConstants.isShowSignIn)
            self?.showLoader = false
        }
    }
    
    func signInExistingUser(with credentials: SignInModel) {
        showLoader = true
        Auth.auth().signIn(withEmail: credentials.email, password: credentials.password) { [weak self] result, error in
            if error != nil {
                self?.showLoader = false
                return
            }
            UserDefaults.standard.set(true, forKey: AppConstants.isUserLogined)
            UserDefaults.standard.set(true, forKey: AppConstants.isShowSignIn)
            self?.showLoader = false
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            UserDefaults.standard.set(false, forKey: AppConstants.isUserLogined)
            UserDefaults.standard.set(true, forKey: AppConstants.isShowSignIn)
        } catch let error {
            debugPrint("Ganpat error occured in sign out Error: \(error)")
        }
    }
}
