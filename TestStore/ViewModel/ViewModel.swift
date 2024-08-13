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
    @Published var productInBasket:[Product] = []
    
    @Published var presentListOrGrid = false


    @Published var emptyBasket = false
    
    @Published var finalPriceBascet:Double = 0
    
    @Published var simpleProduct: BasketModel = BasketModel(title: "", price: 0, count: 0, total: 0)
    
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
    
    //MARK: - Get basket
    func getBasket(){
        productInBasket.removeAll()
        for product in products {
            if product.countInBasket > 0 {
                productInBasket.append(product)
            }
        }
    }
    
    //MARK: - Get final price of basket
    func getFinalPrice(){
        finalPriceBascet = 0
        if !productInBasket.isEmpty {
            for product in productInBasket  {
                finalPriceBascet += product.price * product.countInBasket
            }
        }
    }
    
    //MARK: - Delete basket
    func deleteBasket(){
        productInBasket.removeAll()
        let request = NSFetchRequest<Product>(entityName: "Product")
        
        do{
            products = try manager.context.fetch(request)
            for product in products {
                product.countInBasket = 0
            }
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
        save()
        getFinalPrice()
    }
    
    //MARK: - Add product in basket
    func editeCounOfBasket(id: ObjectIdentifier, count: Double){
        let request = NSFetchRequest<Product>(entityName: "Product")
        
        do{
            products = try manager.context.fetch(request)
            let product = products.first(where: {$0.id == id})
            product?.countInBasket = count
        }catch let error{
            print("Error fetching: \(error.localizedDescription)")
        }
        save()
        getBasket()
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
