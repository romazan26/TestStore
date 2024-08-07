//
//  ViewModel.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import Foundation
import CoreData
import UIKit

final class ViewModel: ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var products: [Product] = []
    
    @Published var presentListOrGrid = false
    
    init(){
        getProduct()
        if products.isEmpty{
            addProduct(title: "Огурцы 1кг", image: UIImage(resource: .image1), price: 300)
            addProduct(title: "Орешки 1кг", image: UIImage(resource: .image2), price: 500)
            addProduct(title: "Курица копченая", image: UIImage(resource: .image3), price: 450)
            addProduct(title: "Купаты 400г", image: UIImage(resource: .image4), price: 800)
            addProduct(title: "Адруналин 0,5л", image: UIImage(resource: .image), price: 250)
            addProduct(title: "Кофе 100г", image: UIImage(resource: .product1), price: 300)
        }
    }
    
    //MARK: - AddProduct
    func addProduct(title: String, image: UIImage, price: Double){
        let newProduct = Product(context: manager.context)
        newProduct.title = title
        newProduct.image = image
        newProduct.price = price
        
        save()
    }
    
    //MARK: - get data
    func getProduct(){
        let request = NSFetchRequest<Product>(entityName: "Product")
        
        do{
            products = try manager.context.fetch(request)
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save Data
    func save(){
        products.removeAll()
        manager.save()
        getProduct()
    }
}
