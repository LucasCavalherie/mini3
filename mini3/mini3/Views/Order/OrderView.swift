//
//  OrderView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderView: View {
    var body: some View {
        ScrollView {
             VStack  {
                VStack {
                    HStack {
                        Text("Embalando")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "arrow.uturn.backward")
                                .foregroundStyle(.background)
                                .fontWeight(.bold)
                                .padding()
                                .background(.red)
                                .cornerRadius(12)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("Avançar")
                                .foregroundStyle(.background)
                                .fontWeight(.bold)
                                .padding()
                                .background(.green)
                                .cornerRadius(12)
                        }
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Itens do pedido")
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        OrderItemCardListView()
                        OrderItemCardListView()
                        OrderItemCardListView()
                        
                    }
                    
                    
                    VStack (alignment: .leading) {
                        Text("Contato do cliente")
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        OrderCustomerCardView()
                    }
                    
                    VStack (alignment: .leading) {
                        Text("Observações")
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        Text("Minha observação")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                    .foregroundColor(.pink)
                            )
                            
                    }
                }
                .padding(.horizontal)
            }
             .padding(.vertical)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Image(systemName: "chevron.backward")
                    .font(.body)
                    .fontWeight(.bold)
            }
            
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Festa de Aniversário")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Text("Qua, 13 de outubro | 14:00")
                        .font(.caption2)
                        .fontWeight(.bold)
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                Image(systemName: "square.and.pencil")
                    .font(.title2)
                    .fontWeight(.bold)
            }
        }
    }
}

#Preview {
    OrderView()
}
