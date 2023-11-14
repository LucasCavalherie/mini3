//
//  OrderView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var showAlert = false
    @State var shouldPresentSheet = false
    
    @State var order : OrderModel
    
    @ObservedObject var viewModel: OrderViewModel = OrderViewModel.shared
    
    func updateOrder() {
        order = viewModel.currentOrder!
    }
    
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
                             Text(order.getStatusName())
                                 .foregroundStyle(Color.secundaria)
                                 .font(.title3)
                                 .fontWeight(.bold)
                             
                             Spacer()
                             
                             if order.status != .canceled {
                                 Button {
                                     viewModel.previousStatus()
                                     updateOrder()
                                 } label: {
                                     Image(systemName: "arrow.uturn.backward")
                                         .foregroundStyle(.background)
                                         .fontWeight(.bold)
                                         .padding()
                                         .background(Color.picoleDeGroselha)
                                         .cornerRadius(12)
                                 }
                             }
                             
                             if order.status != .canceled {
                                 Button {
                                     viewModel.nextStatus()
                                     updateOrder()
                                 } label: {
                                     Text("Avançar")
                                         .foregroundStyle(.background)
                                         .fontWeight(.bold)
                                         .padding()
                                         .background(Color.limaoTahiti)
                                         .cornerRadius(12)
                                 }
                             }
                         }
                         .padding(.horizontal)
                     }
                 }
                 
                VStack (alignment: .leading){
                    VStack (alignment: .leading) {
                        Text("Itens do pedido")
                            .foregroundStyle(Color.principal)
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        ForEach(order.orderItems) { orderItem in
                            OrderItemCardListView(orderItem: orderItem)
                        }
                        
                    }
                    .padding(.vertical)
                    
                    
                    VStack (alignment: .leading) {
                        Text("Contato do cliente")
                            .foregroundStyle(Color.principal)
                            .font(.callout)
                            .fontWeight(.bold)
                        
                        VStack {
                            OrderCustomerCardView(order: order)
                                .padding(.bottom)
                            
                            if order.isPaid {
                                Button {
                                    viewModel.markAsNotPaid(id: order.id)
                                    updateOrder()
                                } label: {
                                    Text("Marcar como pendente")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.brancoNeve)
                                        .padding(8)
                                        .background(.geleiaDeMorango)
                                        .cornerRadius(12)
                                }
                            } else {
                                Button {
                                    viewModel.markAsPaid(id: order.id)
                                    updateOrder()
                                } label: {
                                    Text("Marcar como pago")
                                        .frame(maxWidth: .infinity)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.brancoNeve)
                                        .padding(8)
                                        .background(.verdeMatcha)
                                        .cornerRadius(12)
                                }
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
                        
                        HStack {
                            Text(order.observation)
                                .padding()
                            Spacer()
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                                .foregroundColor(Color.geleiaDeMorango)
                        )
                        
                            
                    }
                    .padding(.vertical)
                    
                    
                    VStack {
                        if order.status != .canceled {
                            Button {
                                showAlert = true
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
                            .alert(isPresented: $showAlert) {
                                Alert(
                                    title: Text("Confirmação"),
                                    message: Text("Tem certeza de que deseja deletar?"),
                                    primaryButton: .destructive(Text("Deletar")) {
                                        viewModel.cancel()
                                        updateOrder()
                                    },
                                    secondaryButton: .cancel()
                                )
                            }
                        }
                            
                        
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
                    Text(order.orderName)
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
                
                
                Button() {
                    shouldPresentSheet.toggle()
                } label: {
                    Image(systemName: "square.and.pencil")
                        .foregroundStyle(Color.amareloGema)
                        .font(.title2)
                        .fontWeight(.semibold)
                }
                .sheet(isPresented: $shouldPresentSheet) {
                    print("Sheet dismissed!")
                } content: {
                    OrderCreateEditView(order: order)
                }
                
            }
        }
        .onAppear{
            viewModel.currentOrder = order
        }
    }
}

#Preview {
    OrderView(order: OrderModel.create())
}
