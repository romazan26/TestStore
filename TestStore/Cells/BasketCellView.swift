//
//  basketCellView.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import SwiftUI

struct BasketCellView: View {
    let product: BasketModel
    var body: some View {
        HStack {
            Text(product.title).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            Divider()
            Text("\(String(format: "%.0f",product.price))")
            Divider()
            Text("\(String(format: "%.01f",product.count))")
            Divider()
            Text("\(String(format: "%.01f",product.total))")
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
    BasketCellView(product: BasketModel(title: "Milk", price: 300, count: 3, total: 900))
}
