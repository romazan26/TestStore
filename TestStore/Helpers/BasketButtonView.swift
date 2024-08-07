//
//  BasketButton.swift
//  TestStore
//
//  Created by Роман on 07.08.2024.
//

import SwiftUI

struct BasketButtonView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 40)
                .frame(width: 48, height: 36)
                .foregroundStyle(.green)
            Image(systemName: "basket.fill")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    BasketButtonView()
}
