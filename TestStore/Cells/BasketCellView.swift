//
//  basketCellView.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import SwiftUI

struct BasketCellView: View {
    let product: Product
    var body: some View {
        HStack(alignment: .top) {
            //MARK: - Title product
            VStack(alignment: .leading) {
                Text("Название:").foregroundStyle(.green)
                Text(product.title ?? "").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            }
            
            Spacer()
            
            Divider()
            //MARK: - Price
            VStack(alignment: .leading) {
                Text("цена:").foregroundStyle(.green)
                Text("\(String(format: "%.0f",product.price))")
            }
            
            Divider()
            //MARK: - count product
            VStack(alignment: .leading) {
                Text("кол.:").foregroundStyle(.green)
                Text("\(String(format: "%.01f",product.countInBasket))")
            }
            
            Divider()
            //MARK: - Total price product
            VStack(alignment: .leading) {
                Text("итог:").foregroundStyle(.green)
                Text("\(String(format: "%.01f",product.countInBasket * product.price))")
            }
        }
        .minimumScaleFactor(0.5)
        .frame(maxWidth: .infinity)
        .frame(height: 60)
        .padding()
        .background(content: {
            Color.white
                .cornerRadius(10)
                .shadow(radius: 10)
        })
        
    }
}

#Preview {
    BasketCellView(product: Product())
}
