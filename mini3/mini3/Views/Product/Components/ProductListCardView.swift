//
//  ProductListCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductListCardView: View {
    var body: some View {
        HStack {
            VStack {
                Image("Sacola")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 45)
            }
            .foregroundStyle(.background)
            .padding()
            .background(Color.geleiaDeMorango)
            
            VStack (alignment: .leading) {
                Text("Bolo de Pedreiro")
                    .font(.headline)
                    .foregroundStyle(Color.secundaria)
                
                Text("Detalhe breve do pedido")
                    .font(.caption2)
                    .foregroundStyle(Color.chocolateAoLeite)
            }
            .padding(.horizontal)
           
            
            Spacer()
        }
        .padding(.trailing)
        .background(Color.brancoNeve)
        .cornerRadius(8)
    }
}

#Preview {
    ProductListCardView()
}
