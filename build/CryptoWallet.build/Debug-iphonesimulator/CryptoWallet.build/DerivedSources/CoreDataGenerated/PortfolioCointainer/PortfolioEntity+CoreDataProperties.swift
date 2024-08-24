//
//  PortfolioEntity+CoreDataProperties.swift
//  
//
//  Created by Ganpat Jangir on 17/08/24.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension PortfolioEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PortfolioEntity> {
        return NSFetchRequest<PortfolioEntity>(entityName: "PortfolioEntity")
    }

    @NSManaged public var amount: Double
    @NSManaged public var coinId: String?

}

extension PortfolioEntity : Identifiable {

}
