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
    let id: ObjectIdentifier
    
    var body: some View {
        ZStack {
            Color.green
            HStack {
                //MARK: - -0.1 Button
                Button(action: {
                    if countPosition > 0 {
                        countPosition -= 0.1
                        vm.editeCounOfBasket(id: id, count: countPosition)
                        
                        if countPosition == 0{
                            isPresent = false
                            vm.editeCounOfBasket(id: id, count: countPosition)
                        }
                    }
                    
                }, label: {
                    Image(systemName: "minus")
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                })
                
                Spacer()
                
                //MARK: - Title count position
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
                //MARK: - +0.1 Button
                Button(action: {
                    if countPosition > 0 {
                        countPosition += 0.1
                        vm.editeCounOfBasket(id: id, count: countPosition)
                    }
                    
                }, label: {
                    Image(systemName: "plus")
                        .foregroundStyle(.white)
                        .frame(width: 30, height: 30)
                })
            }.padding()
        }
        .onAppear(perform: {
            if !vm.emptyBasket{
                vm.editeCounOfBasket(id: id, count: countPosition) 
            }
        })
        .frame(height: 36)
        .cornerRadius(40)
    }
}

//#Preview {
//    AddInBasket(vm: ViewModel(), countPosition: .constant(0.1), isPresent: .constant(true), price: 10, title: "Milk")
//}
