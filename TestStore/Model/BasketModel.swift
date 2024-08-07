//
//  BasketModel.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import Foundation

struct BasketModel: Identifiable{
    let id = UUID()
    let title: String
    let price: Double
    let count: Double
    let total: Double
}
