//
//  OrderListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation
import SwiftUI

struct OrderListView: View {
    @State var shouldPresentSheet = false
    
    @ObservedObject var viewModel: OrderViewModel = OrderViewModel.shared
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Cremosinho_Tab")
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .top) {
                        Image("LogoPave")
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
                Spacer()
                
                if viewModel.listTodayOrders().count == 0 && viewModel.listTodayOrders().count == 0 && viewModel.listTodayOrders().count == 0 {
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
                    ScrollView (showsIndicators: false) {
                        
                        VStack(spacing: 8){
                            
                            if viewModel.listTodayOrders().count > 0 {
                                VStack {
                                    HStack {
                                        Text("Hoje")
                                            .foregroundStyle(Color("principal"))
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                    }
                                    
                                    ForEach(viewModel.listTodayOrders()) { order in
                                        NavigationLink {
                                            OrderView(order: order)
                                        } label: {
                                            OrderListCardView(order: order)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            if viewModel.listNext7DaysOrders().count > 0 {
                                VStack {
                                    HStack {
                                        Text("Essa semana")
                                            .foregroundStyle(Color("principal"))
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                    }
                                    
                                    ForEach(viewModel.listNext7DaysOrders()) { order in
                                        NavigationLink {
                                            OrderView(order: order)
                                        } label: {
                                            OrderListCardView(order: order)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                            if viewModel.listNext30DaysOrders().count > 0 {
                                VStack {
                                    HStack {
                                        Text("Esse mês")
                                            .foregroundStyle(Color("principal"))
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                        
                                        Spacer()
                                    }
                                    
                                    ForEach(viewModel.listNext30DaysOrders()) { order in
                                        NavigationLink {
                                            OrderView(order: order)
                                        } label: {
                                            OrderListCardView(order: order)
                                        }
                                    }
                                    
                                    Spacer()
                                }
                            }
                            
                        }
                    }
                    .padding(32)
                    
                }
            }
            .background(Color.algodaoDoce.edgesIgnoringSafeArea(.bottom))
        }
    }
}

#Preview {
    OrderListView()
}
