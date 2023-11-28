//
//  OrderCustomerCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderCustomerCardView: View {
    
    var order : OrderModel
    
    var body: some View {
        HStack {
            Image(order.isPaid ? "Contato" : "ContatoVermelho")
            
            VStack (alignment: .leading){
                VStack (alignment: .leading) {
                    Text(order.customer.name)
                        .foregroundStyle(Color.principal)
                        .font(.headline)
                    
                    Text(order.customer.contact)
                        .foregroundStyle(Color.chocolateAoLeite)
                        .font(.caption)
                }
                .padding(.bottom)
                
                
                HStack {
                    Image(systemName: "dollarsign.square.fill")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundStyle(order.isPaid ? Color.verdeMatcha: Color.picoleDeGroselha)
                    
                    Text(order.isPaid ? "Pedido pago": "Pagamento pendente")
                        .foregroundStyle(Color.secundaria)
                        .font(.caption)
                        .fontWeight(.medium)
                }
                
            }
            .padding(.horizontal, 8)
            
            Spacer()
            
            
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
        .background(Color.brancoNeve)
        .cornerRadius(8)
    }
}

#Preview {
    OrderCustomerCardView(order: OrderModel.create(isPaid: false))
}
