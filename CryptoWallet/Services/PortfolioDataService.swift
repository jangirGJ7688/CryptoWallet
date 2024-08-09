//
//  PortfolioDataService.swift
//  CryptoWallet
//
//  Created by Ganpat Jangir on 20/06/24.
//

import Foundation
import CoreData

class PortfolioDataService {
    
    private let cointainer: NSPersistentContainer
    private let cointainerName: String = "PortfolioCointainer"
    private let entityName: String = "PortfolioEntity"
    
    @Published var savedEntities: [PortfolioEntity] = []
    
    init() {
        self.cointainer = NSPersistentContainer(name: cointainerName)
        self.cointainer.loadPersistentStores { (_, error) in
            if let error = error {
                debugPrint("Ganpat there is error in loading persistent store with error: \(error.localizedDescription)")
            }
            self.getPortfolio()
            debugPrint("Ganpat persistent store is loaded successfully")
        }
    }
    
    // MARK: PUBLIC
    
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        if let entity = savedEntities.first(where: {$0.coinId == coin.id}) {
            if amount > 0 {
                updateCoin(entity: entity, amount: amount)
            } else {
                deleteCoin(entity: entity)
            }
        }else {
            addEntity(coin: coin, amount: amount)
        }
    }
    
    func savePortfolio(coin: CoinModel, amount: Double) {
        addEntity(coin: coin, amount: amount)
    }
    
    func deletePortfolio(coin: CoinModel) {
        if let entity = savedEntities.first(where: {$0.coinId == coin.id}) {
            deleteCoin(entity: entity)
        }
    }
    
    // MARK: PRIVATE
    
    private func getPortfolio() {
        let request = NSFetchRequest<PortfolioEntity>(entityName: entityName)
        do {
            self.savedEntities = try cointainer.viewContext.fetch(request)
        } catch let error {
            debugPrint("Ganpat some error occure while fetching entitites with error: \(error.localizedDescription)")
        }
    }
    
    private func addEntity(coin: CoinModel, amount: Double) {
        let entity = PortfolioEntity(context: cointainer.viewContext)
        entity.coinId = coin.id
        entity.amount = amount
        applyChanges()
    }
    
    private func save() {
        do {
            try cointainer.viewContext.save()
        } catch let error {
            debugPrint("Ganpat some error occure while saving to core data with error: \(error.localizedDescription)")
        }
    }
    
    private func applyChanges() {
        save()
        getPortfolio()
    }
    
    private func updateCoin(entity: PortfolioEntity, amount: Double) {
        entity.amount = amount
        applyChanges()
    }
    
    private func deleteCoin(entity: PortfolioEntity) {
        cointainer.viewContext.delete(entity)
        applyChanges()
    }
}
