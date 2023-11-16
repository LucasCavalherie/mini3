//
//  OrderListDoneView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderListDoneView: View {
    @State var shouldPresentSheet = false
    @ObservedObject var viewModel = OrderViewModel.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Cremosinho_Tab")
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .top) {
                        Image("pedidos")
                            .resizable()
                            .frame(width: 150, height: 50)
                        Spacer()
                        
                        Button() {
                            shouldPresentSheet.toggle()
                        } label: {
                            AddButtonView()
                        }
                        .sheet(isPresented: $shouldPresentSheet) {
                            print("Sheet dismissed!")
                        } content: {
                            OrderCreateEditView()
                        }
                        
                    }
                    .padding(.horizontal, 32)
                }
                
                if viewModel.listAllOrders().count == 0 {
                    VStack {
                        Spacer()
                        Image("Pavinho_Triste")
                        VStack {
                            Text("Uh-oh")
                            Text("Parece que não nenhum pedido")
                            Text("por aqui, que tal adicionar um novo?")
                        }
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.picoleDeGroselha)
                        Spacer()
                    }
                } else {
                    VStack(spacing: 8){
                        
                        HStack {
                            Text("Todas os pedidos")
                                .foregroundStyle(Color("principal"))
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Button(action: {
                                print("sort ascendente/descendente")
                            }, label: {
                                Image(systemName: "arrow.up.arrow.down.square")
                                    .foregroundStyle(Color("principal"))
                            })
                            
                            Button(action: {
                                print("sort entrega, criaçao e nome")
                            }, label: {
                                Image(systemName: "line.3.horizontal.decrease.circle")
                                    .foregroundStyle(Color("principal"))
                            })
                        }
                        
                        ScrollView (showsIndicators: false){
                            VStack {
                                ForEach (viewModel.listAllOrders()) { order in
                                    NavigationLink {
                                        OrderView(order: order)
                                    } label: {
                                        OrderListCardView(order: order)
                                    }
                                }
                                
                            }
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 32)
                }
            }
            .background(Color.algodaoDoce.edgesIgnoringSafeArea(.bottom))
        }
    }
}

#Preview {
    OrderListDoneView()
}
