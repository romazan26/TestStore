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
        
        NavigationView {
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
                    
                    
                    
                }
                Divider()
                
                //MARK: - Product list
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
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
                    //MARK: - Basket button
                    NavigationLink {
                        Basketview(vm: vm)
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black.opacity(0.5))
                                .frame(width: 70)
                            Image(systemName: "basket.fill")
                                .resizable()
                                .foregroundStyle(.green)
                                .frame(width: 50, height: 50)
                            if vm.productInBasket.count > 0{
                                ZStack{
                                    Circle()
                                        .foregroundStyle(.red)
                                        .frame(width: 20)
                                    Text("\(vm.productInBasket.count)")
                                        .foregroundStyle(.white)
                                }.offset(x: 30,y: -30)
                            }
                                
                        }
                    }
                }
            }
            .padding()
        }
                
            
    }
}

#Preview {
    Store()
}
