//
//  OrderItemCardAddView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderItemCardAddView: View {
    @State var value = 0
    
    var body: some View {
        HStack {
            Stepper(value: $value) {
                HStack {
                    VStack {
                        Image("Sacola")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 45)
                    }
                    .foregroundStyle(.background)
                    .padding(8)
                    .background(Color.geleiaDeMorango)
                    
                    Text("Bolo de Pedreiro")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.secundaria)
                    
                    
                    
                    Spacer()
                    
                    Text("\(value)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.picoleDeGroselha)
                        .padding(.trailing)
                }
                .background(Color.brancoNeve)
                .cornerRadius(8)
            }
        }
        
        
    }
}

#Preview {
    OrderItemCardAddView()
}
