//
//  Basketview.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import SwiftUI

struct Basketview: View {
    @StateObject var vm: ViewModel
    var body: some View {
        VStack {
            HStack {
                Text("Корзина")
                    .font(.title)
                
                Spacer()
                
                Button("Очистить корзину") {
                    vm.deleteBasket()
                }
            }
            ScrollView {
                ForEach(vm.basket) { product in
                    BasketCellView(product: product)
                        .padding()
                }
            }
        }
        .padding()
        .onAppear(perform: {
            vm.addInBasket()
        })
    }
}

#Preview {
    Basketview(vm: ViewModel())
}
