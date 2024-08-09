//
//  NetworkingManager.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 18/06/24.
//

import Foundation
import Combine

struct NetworkingManager {
    
    static func downloading(request: URLRequest) -> AnyPublisher<Data, Error> {
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap({ try handleURLResponse(output: $0)})
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static private func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data{
        guard let response = output.response as? HTTPURLResponse,  response.statusCode == 200 else{
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            debugPrint("Error in Json parsing with error: \(error)")
        }
    }
    
}
