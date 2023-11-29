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
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel.shared
    
    @StateObject private var purchaseManager = PurchaseManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Cremosinho_Tab")
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .top) {
                        Image("LogoPave")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 50)
                        Spacer()
                        
                        Button() {
                            shouldPresentSheet.toggle()
                        } label: {
                            AddButtonView()
                        }
                        .sheet(isPresented: $shouldPresentSheet) {
                            print("Sheet dismissed!")
                        } content: {
                            if !mainViewModel.versionPro && viewModel.listAllOrders().count >= mainViewModel.orderLimitFree {
                                PaidView()
                                    .environmentObject(purchaseManager)
                                    .task {
                                        await purchaseManager.updatePurchasedProducts()
                                    }
                            } else {
                                OrderCreateEditView()
                            }
                        }
                        
                    }

                    .padding(.horizontal, 32)
                }
                
                Spacer()
                
                if viewModel.listTodayOrders().count == 0 && 
                    viewModel.listNext7DaysOrders().count == 0 &&
                    viewModel.listNext30DaysOrders().count == 0 {
                    VStack {
                        Spacer()
                        Image("Pavinho_Triste")
                            .padding(16)
                        VStack {
                            Text("Uh-oh!")
                                .font(.title)

                            Text("Parece que não tem nenhum pedido por aqui, que tal adicionar um novo?")
                                .padding(.horizontal, 32)
                                .multilineTextAlignment(.center)
                        }
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.picoleDeGroselha)
                        Spacer()
                    }
                    .frame(maxHeight: 600)
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
