//
//  Basketview.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import SwiftUI

struct Basketview: View {
    @StateObject var vm: ViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            HStack {
                
                Spacer()
                
                //MARK: - Delete button
                Button(action: {
                    vm.deleteBasket()
                    dismiss()
                    vm.emptyBasket = true}, label: {
                    Text("Очистить корзину").foregroundStyle(.red)
                })
            }
            
            //MARK: - List product in basket
            ScrollView {
                ForEach(vm.productInBasket) { product in
                    BasketCellView(product: product)
                        .padding()
                }
            }
            HStack {
                Text("Итого:")
                Spacer()
                Text(String(format: "%.01f", vm.finalPriceBascet))
            }.font(.title)
        }
        .navigationTitle("Корзина")
        .padding()
        .onAppear(perform: {
            vm.getBasket()
            vm.getFinalPrice()
        })
    }
}

#Preview {
    Basketview(vm: ViewModel())
}
