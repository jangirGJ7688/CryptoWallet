//
//  ProfileTabViewModel.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 31/08/24.
//

import Foundation
import UIKit

class ProfileTabViewModel: ObservableObject {
    
    @Published private(set) var user: UserModel?
    @Published var selectedImage: UIImage? {
        didSet {
            Task {
                try await StorageManager.shared.uploadProfileImage(image: selectedImage)
            }
        }
    }
    
    init() {
        Task {
            await loadImage()
            await loadCurrentUser()
        }
    }
    
    private func loadImage() async {
        do {
            let image = try await StorageManager.shared.getProfileImage()
            DispatchQueue.main.async {
                self.selectedImage = image
            }
        } catch let error {
            debugPrint("Error: \(error.localizedDescription)")
        }
        
    }
    
    private func loadCurrentUser() async {
        do {
            let user = try await UserManager.shared.getUser()
            DispatchQueue.main.async {
                self.user = user
            }
        } catch let error {
            debugPrint("Error: \(error.localizedDescription)")
        }
    }
    
    func signOut() async {
        do {
            try await AuthenticationDataService.shared.signOut()
        } catch let error {
            debugPrint("Error in signing out: \(error.localizedDescription)")
        }
    }
    
}
