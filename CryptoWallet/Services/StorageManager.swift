//
//  StorageManager.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 29/08/24.
//

import Foundation
import FirebaseStorage
import UIKit

final class StorageManager {
    
    enum StorageError: Error {
        case invalidImage
        case noImageExist
    }
    
    static let shared = StorageManager()
    private init() {}
    
    private let storage = Storage.storage().reference()
    
    private var profileImageRefrence: StorageReference {
        storage.child("profiles")
    }
    
    func uploadProfileImage(image: UIImage?) async throws {
        let userId = try AuthenticationDataService.shared.getAuthenticatedUser()
        guard let img = image, let data = img.jpegData(compressionQuality: 0.5) else {
            throw StorageError.invalidImage
        }
        let meta = StorageMetadata()
        meta.contentType = "image/jpeg"
        
        let path = "\(userId).jpeg"
        let _ = try await profileImageRefrence.child(path).putDataAsync(data,metadata: meta)
    }
    
    func getProfileImage() async throws -> UIImage? {
        let userId = try AuthenticationDataService.shared.getAuthenticatedUser()
        let path = "\(userId).jpeg"
        let data = try await profileImageRefrence.child(path).data(maxSize: 3 * 1024 * 1024)
        guard let image = UIImage(data: data) else {
            throw StorageError.noImageExist
        }
        return image
    }
}
