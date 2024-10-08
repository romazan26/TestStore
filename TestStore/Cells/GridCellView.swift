//
//  GridCellView.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import SwiftUI

struct GridCellView: View {
    
    @StateObject var vm: ViewModel
    @State private var isFavorite = false
    @State private var isPresent = false
    @State var countPosition = 0.1
    
    @ObservedObject var product: Product
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                Image(uiImage: product.image ?? .product1)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 148, height: 128)
                //MARK: - fatura and favorite
                VStack{
                    Image(systemName: "doc.richtext")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(.gray)
                    Button {
                        isFavorite.toggle()
                    } label: {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(isFavorite ? .green : .gray)
                    }
                }
                .padding(10)
                .background(Color.white
                    .cornerRadius(20)
                    .opacity(0.5)
                    .frame(width: 32, height: 64))
            }
            //MARK: - Rang
            HStack{
                
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                Text("4.1")
            }
            
            //MARK: - Title
            Text("\(product.title ?? "")")
                .foregroundStyle(.black)
                .font(.system(size: 12))
                .padding(.top, 3)
            
            Spacer()
            //MARK: - Price
            if !vm.emptyBasket{
                if isPresent{
                    AddInBasket(vm: vm,
                                countPosition: $countPosition,
                                isPresent: $isPresent,
                                price: product.price,
                                title: product.title ?? "", id: product.id)
                    .frame(width: 150)
                }else{
                    HStack{
                        VStack(alignment: .leading) {
                            Text("\(String(format: "%.01f",product.price)) р/кг")
                                .font(.system(size: 13, weight: .heavy))
                                .foregroundStyle(.black)
                            Text("1199,0").foregroundStyle(.gray).strikethrough()
                        }
                        
                        Spacer()
                        Button(action: {
                            isPresent.toggle()
                            countPosition = 0.1
                        }, label: {
                            BasketButtonView()
                        })
                    }
                }
            }else{
                HStack{
                    VStack(alignment: .leading) {
                        Text("\(String(format: "%.01f",product.price)) р/кг")
                            .font(.system(size: 13, weight: .heavy))
                            .foregroundStyle(.black)
                        Text("1199,0").foregroundStyle(.gray).strikethrough()
                    }
                    
                    Spacer()
                    Button(action: {
                        isPresent.toggle()
                        vm.emptyBasket = false
                        countPosition = 0.1
                    }, label: {
                        BasketButtonView()
                    })
                }
            }
            
                
            
        }
        .onAppear(perform: {
            if vm.emptyBasket {
                isPresent = false
            }
            if product.countInBasket > 0 {
                isPresent = true
            }
        })
        .frame(width: 130, height: 238)
        .padding()
        .background {
            Color.white
                .cornerRadius(20)
                .shadow(radius: 5)
        }
    }
}


//#Preview {
//    GridCellView()
//}
