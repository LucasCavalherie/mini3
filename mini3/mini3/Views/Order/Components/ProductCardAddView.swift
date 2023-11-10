//
//  ProductCardAddView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductCardAddView: View {
    @State var value = false
    
    var body: some View {
        HStack {
            Toggle(isOn: $value) {
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
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.secundaria)
                        .padding(.horizontal)
                    
                }
            }
            .padding(.trailing)
        }
        .background(Color.brancoNeve)
        .cornerRadius(8)
    }
}

#Preview {
    ProductCardAddView()
}
