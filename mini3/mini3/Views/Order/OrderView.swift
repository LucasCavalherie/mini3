//
//  OrderView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
             VStack  {
                 ZStack {
                     Image("Cremosinho_Detalhe")
                         .resizable()
                     
                     VStack {
                         OrderStatusListView()
                             .padding(.vertical)
                         
                         HStack {
                             Text("Embalando")
                                 .foregroundStyle(Color.secundaria)
                                 .font(.title3)
                                 .fontWeight(.bold)
                             
                             Spacer()
                             
                             Button {
                                 
                             } label: {
                                 Image(systemName: "arrow.uturn.backward")
                                     .foregroundStyle(.background)
                                     .fontWeight(.bold)
                                     .padding()
                                     .background(Color.picoleDeGroselha)
                                     .cornerRadius(12)
                             }
                             
                             Button {
                                 
                             } label: {
                                 Text("Avançar")
                                     .foregroundStyle(.background)
                                     .fontWeight(.bold)
                                     .padding()
                                     .background(Color.limaoTahiti)
                                     .cornerRadius(12)
                             }
                         }
                         .padding(.horizontal)
                     }
                 }
                 
                VStack {
                    VStack (alignment: .leading) {
                        Text("Itens do pedido")
                            .foregroundStyle(Color.principal)
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        OrderItemCardListView()
                        OrderItemCardListView()
                        OrderItemCardListView()
                        
                    }
                    .padding(.vertical)
                    
                    
                    VStack (alignment: .leading) {
                        Text("Contato do cliente")
                            .foregroundStyle(Color.principal)
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        VStack {
                            OrderCustomerCardView()
                                .padding(.bottom)
                            
                            Button {
                                print("flamengo")
                            } label: {
                                Text("Marcar como pago")
                                    .frame(maxWidth: .infinity)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(Color.brancoNeve)
                                    .padding(8)
                                    .background(Color.verdeMatcha)
                                    .cornerRadius(12)
                            }
                        }
                        .padding(.horizontal)
                        
                        
                    }
                    .padding(.vertical)
                    
                    VStack (alignment: .leading) {
                        Text("Observações")
                            .foregroundStyle(Color.principal)
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        Text("Minha observação")
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                    .foregroundColor(Color.geleiaDeMorango)
                            )
                            
                    }
                    .padding(.vertical)
                    
                    
                    VStack {
                        Button {
                            print("flamengo")
                        } label: {
                            Text("Cancelar pedido")
                                .frame(maxWidth: .infinity)
                                .font(.title3)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color.brancoNeve)
                                .padding(8)
                                .background(Color.picoleDeGroselha)
                                .cornerRadius(12)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.horizontal)
            }
        }
        .background(Color.algodaoDoce.edgesIgnoringSafeArea(.bottom))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.geleiaDeMorango)
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
            
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Festa de Aniversário")
                        .foregroundStyle(Color.principal)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("Qua, 13 de outubro | 14:00")
                        .foregroundStyle(Color.principal)
                        .font(.caption2)
                        .fontWeight(.bold)
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                Image(systemName: "square.and.pencil")
                    .foregroundStyle(Color.amareloGema)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    OrderView()
}
