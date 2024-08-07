//
//  ContentView.swift
//  TestStore
//
//  Created by Роман on 06.08.2024.
//

import SwiftUI

struct Store: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        vm.presentListOrGrid.toggle()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .foregroundStyle(.gray.opacity(0.15))
                                .frame(width: 40, height: 40)
                            Image(systemName: vm.presentListOrGrid ? "rectangle.split.1x2" : "rectangle.split.2x2")
                                .imageScale(.large)
                            .foregroundStyle(.green)
                        }
                }
                    Button(action: {vm.isPresentBasket.toggle()}, label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .foregroundStyle(.gray.opacity(0.15))
                                .frame(width: 40, height: 40)
                            Image(systemName: "basket")
                                .foregroundStyle(.green)
                        }
                    })
                }
                Divider()
                ScrollView {
                if vm.presentListOrGrid{
                    ScrollView{
                        ForEach(vm.products) { product in
                            ListCellView(vm: vm, product: product)
                        }
                    }
                }else {
                    LazyVGrid(columns: [GridItem(),GridItem()],spacing: 10, content: {
                        ForEach(vm.products) { product in
                            GridCellView(vm: vm, product: product)
                        }
                    })
                }
               
               
            }
           
        }
            .padding()
            .sheet(isPresented: $vm.isPresentBasket, content: {
                Basketview(vm: vm)
            })
    }
}

#Preview {
    Store()
}
