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
                .opacity(1)
            
            VStack {
                VStack (alignment: .leading) {
                    Text("Cláudio")
                        .font(.headline)
                    
                    Text("(65) 98765-4321")
                        .font(.caption)
                }
                .padding(.bottom)
                
                
                HStack {
                    Image(systemName: "dollarsign.square.fill")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundStyle(.green)
                    
                    Text("Pedido pago")
                        .font(.caption)
                        .fontWeight(.medium)
                }
                
            }
            .padding(.horizontal)
            
            Spacer()
            
            Image(systemName: "phone.circle.fill")
                .foregroundStyle(.background)
                .padding(8)
                .background(Color.green)
                .clipShape(Circle())
            
        }
        .padding()
        .background(.tertiary)
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    OrderCustomerCardView()
}
