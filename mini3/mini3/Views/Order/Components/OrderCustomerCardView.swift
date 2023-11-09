//
//  OrderCustomerCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderCustomerCardView: View {
    var body: some View {
        HStack {
            Image("Contato")
            
            VStack {
                VStack (alignment: .leading) {
                    Text("Cláudio")
                        .foregroundStyle(Color.principal)
                        .font(.headline)
                    
                    Text("(65) 98765-4321")
                        .foregroundStyle(Color.chocolateAoLeite)
                        .font(.caption)
                }
                .padding(.bottom)
                
                
                HStack {
                    Image(systemName: "dollarsign.square.fill")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.verdeMatcha)
                    
                    Text("Pedido pago")
                        .foregroundStyle(Color.secundaria)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            Image(systemName: "phone.circle.fill")
                .foregroundStyle(.background)
                .padding(8)
                .background(Color.limaoTahiti)
                .clipShape(Circle())
            
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(Color.brancoNeve)
        .cornerRadius(8)
    }
}

#Preview {
    OrderCustomerCardView()
}
