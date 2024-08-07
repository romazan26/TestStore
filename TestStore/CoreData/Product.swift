//
//  Product+CoreDataProperties.swift
//
//
//  Created by Роман on 07.08.2024.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import UIKit

@objc(Product)
public class Product: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var image: UIImage?
    @NSManaged public var price: Double
    @NSManaged public var title: String?

}

extension Product : Identifiable {

}
