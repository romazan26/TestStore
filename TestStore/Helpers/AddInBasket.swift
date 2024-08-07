//
//  AddInBasket.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import SwiftUI

struct AddInBasket: View {
    
    @StateObject var vm: ViewModel
    
    @Binding var countPosition: Double
    @Binding var isPresent: Bool
    
    let price: Double
    let title: String
    
    var body: some View {
        ZStack {
            Color.green
            HStack {
                Button(action: {
                    if countPosition > 0 {
                        countPosition -= 0.1
                        vm.simpleProduct = BasketModel(title: title, price: price, count: countPosition, total: countPosition * price)
                        if countPosition == 0{
                            isPresent = false
                        }
                    }
                    
                }, label: {
                    Image(systemName: "minus")
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                })
                Spacer()
                VStack {
                    Text("\(String(format: "%.01f", countPosition)) кг")
                        .foregroundStyle(.white)
                        .font(.system(size: 14, weight: .heavy))
                        .minimumScaleFactor(0.5)
                    Text("\(String(format: "%.01f",countPosition * price))")
                        .foregroundStyle(.white)
                        .font(.system(size: 10))
                }
                Spacer()
                Button(action: {
                    if countPosition > 0 {
                        countPosition += 0.1
                        vm.simpleProduct = BasketModel(title: title, price: price, count: countPosition, total: countPosition * price)
                    }
                    
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                })
            }.padding()
        }
        .onAppear(perform: {
            vm.addInBasket()
            vm.simpleProduct = BasketModel(title: title, price: price, count: countPosition, total: countPosition * price)
        })
        .frame(height: 36)
        .cornerRadius(40)
    }
}

#Preview {
    AddInBasket(vm: ViewModel(), countPosition: .constant(0.1), isPresent: .constant(true), price: 10, title: "Milk")
}
