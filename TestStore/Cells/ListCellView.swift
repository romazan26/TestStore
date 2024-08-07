//
//  ListCellView.swift
//  TestStore
//
//  Created by Роман on 06.08.2024.
//

import SwiftUI

struct ListCellView: View {
    @State private var isPresent = false
    @State private var isFavorite = false
    @State var countPosition = 0.1
    
    let product: Product
    var body: some View {
        HStack {
            Image(uiImage: product.image ?? .product1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 144, height: 144)
            
            VStack {
                //MARK: - Title
                HStack {
                    VStack(alignment: .leading) {
                        HStack{
                            //MARK: - Rang
                            Image(systemName: "star.fill")
                            Text("4.1")
                            ///Devider
                            Rectangle()
                                .frame(width: 1, height: 16)
                            //MARK: - count feedback
                            Text("19 отзывов")
                                .foregroundStyle(.gray)
                        }
                        Text("\(product.title ?? "")")
                    }
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
                }
                Spacer()
                //MARK: - Price
                if isPresent {
                    AddInBasket(countPosition: $countPosition, isPresent: $isPresent, price: product.price)
                }else{
                    HStack{
                        VStack(alignment: .leading) {
                            Text("\(String(format: "%.01f", product.price)) р/кг")
                                .font(.system(size: 20, weight: .heavy))
                            Text("1199,0").foregroundStyle(.gray).strikethrough()
                        }
                        Spacer()
                        Button(action: {
                            isPresent = true
                            countPosition = 0.1}, label: {
                            BasketButtonView()
                        })
                    }
                }
            }
        }
        .padding()
        .frame(width: 375, height: 176)
    }
}

//#Preview {
//    ListCellView()
//}
