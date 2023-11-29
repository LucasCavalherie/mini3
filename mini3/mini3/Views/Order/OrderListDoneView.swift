//
//  OrderListDoneView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

enum OrderSort {
    case nameAsc
    case nameDesc
    case deliveryDateAsc
    case deliveryDateDesc
}

struct OrderListDoneView: View {
    @State var shouldPresentSheet = false
    @ObservedObject var viewModel = OrderViewModel.shared
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel.shared
    @StateObject private var purchaseManager = PurchaseManager()
    
    @State var sort : OrderSort = .nameAsc
    @State var filterStatus : OrderStatus? = nil
    @State var orders : [OrderModel] = []
    
    func applySort() {
        switch sort {
            case .nameAsc:
                orders.sort{$0.orderName < $1.orderName}
            case .nameDesc:
                orders.sort{$0.orderName > $1.orderName}
            case .deliveryDateAsc:
                orders.sort{$0.deliveryDate < $1.deliveryDate}
            case .deliveryDateDesc:
                orders.sort{$0.deliveryDate > $1.deliveryDate}
        }
    }
    
    func getOrders() -> [OrderModel] {
        if let filterStatus = filterStatus {
            switch filterStatus {
                case .toDo:
                    return orders.filter { order in order.status == .toDo }
                case .doing:
                    return orders.filter { order in order.status == .doing }
                case .packing:
                    return orders.filter { order in order.status == .packing }
                case .toDeliver:
                    return orders.filter { order in order.status == .toDeliver }
                case .done:
                    return orders.filter { order in order.status == .done }
                case .canceled:
                    return orders.filter { order in order.status == .canceled }
            }
        }
        
        return orders
    }
    
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
                            orders = viewModel.listAllOrders()
                            applySort()
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
                
                if getOrders().count == 0 {
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
                    VStack(spacing: 8){
                        
                        HStack {
                            Text("Todas os pedidos")
                                .foregroundStyle(Color("principal"))
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Menu {
                                Button {
                                    sort = .nameAsc
                                } label: {
                                    Text("Nome (Crescente)")
                                }
                                Button {
                                    sort = .nameDesc
                                } label: {
                                    Text("Nome (Decrescente)")
                                }
                                Button {
                                    sort = .deliveryDateAsc
                                } label: {
                                    Text("Data de entrega (Crescente)")
                                }
                                Button {
                                    sort = .deliveryDateDesc
                                } label: {
                                    Text("Data de entrega (Decrescente)")
                                }
                            } label: {
                                Image(systemName: "arrow.up.arrow.down.square.fill")
                                    .font(.title3)
                                    .foregroundStyle(.verdeMatcha)
                            }
                            
                            Menu {
                                Button {
                                    filterStatus = nil
                                } label: {
                                    Text("Todos")
                                }
                                Button {
                                    filterStatus = .toDo
                                } label: {
                                    Text("A Fazer")
                                }
                                Button {
                                    filterStatus = .doing
                                } label: {
                                    Text("Fazendo")
                                }
                                Button {
                                    filterStatus = .packing
                                } label: {
                                    Text("Embalando")
                                }
                                Button {
                                    filterStatus = .toDeliver
                                } label: {
                                    Text("A Entregar")
                                }
                                Button {
                                    filterStatus = .done
                                } label: {
                                    Text("Feito")
                                }
                                Button {
                                    filterStatus = .canceled
                                } label: {
                                    Text("Cancelado")
                                }
                            } label: {
                                Image(systemName: "line.3.horizontal.decrease.circle.fill")
                                    .font(.title3)
                                    .foregroundStyle(.verdeMatcha)
                            }
                        }
                        
                        ScrollView (showsIndicators: false){
                            VStack {
                                ForEach (getOrders()) { order in
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
            .onAppear {
                orders = viewModel.listAllOrders()
                applySort()
            }
            .onChange(of: sort) { _, _ in
                applySort()
            }
        }
    }
}

#Preview {
    OrderListDoneView()
}
