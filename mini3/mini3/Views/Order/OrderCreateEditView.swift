//
//  OrderCreateEditView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderCreateEditView: View {
    
    @State var order : OrderModel? = nil
    
    @State var name = ""
    @State var observation = ""
    @State var customerName = ""
    @State var customerContact = ""
    @State var date : Date = Date()
    
    @State var shouldPresentSheet = false
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: OrderViewModel = OrderViewModel.shared
    @ObservedObject var orderItemViewModel: OrderItemViewModel = OrderItemViewModel.shared
    
    var body: some View {
        VStack {
            HStack {
                Text("Adicionar pedido")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.principal)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    CloseButtonView()
                }
            }
            .padding(.top, 32)
            .padding(.horizontal, 32)
            
            Form {
                Section {
                    TextField("Nome do pedido...", text: $name)
                    TextField("Nome do cliente...", text: $customerName)
                    TextField("Contato do clinte...", text: $customerContact)
                }
                
                Section {
                    TextField("Observação...", text: $observation, axis: .vertical)
                }
            }
            .frame(height: 275)
            .padding(.horizontal, 12)
            .scrollContentBackground(.hidden)
            .background(.algodaoDoce)
            .formStyle(.grouped)
            
            VStack (alignment: .leading) {
                
                DatePicker("Entrega", selection: $date)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.principal)
                
                HStack {
                    Text("Itens do pedido")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.principal)
                    
                    Spacer()
                    
                    Button() {
                        shouldPresentSheet.toggle()
                    } label: {
                        AddButtonView()
                    }
                    .sheet(isPresented: $shouldPresentSheet) {
                        print("Sheet dismissed!")
                    } content: {
                        OrderAddItemView()
                    }
                }
                .padding(.top)
                
                ScrollView (showsIndicators: false) {
                    ForEach (orderItemViewModel.orderItemModels) { orderItem in
                        OrderItemCardAddView(orderItem: orderItem)
                    }
                }
                
                Button {
                    if let order = order {
                        viewModel.editOrder(
                            id: order.id,
                            orderName: name,
                            deliveryDate: date,
                            observation: observation,
                            value: 0,
                            isPaid: false,
                            customerName: customerName,
                            customerContact: customerContact,
                            contactForm: .whatsapp
                        )
                    } else {
                        viewModel.addOrder(
                            orderName: name,
                            deliveryDate: date,
                            observation: observation,
                            value: 0,
                            isPaid: false,
                            customerName: customerName,
                            customerContact: customerContact,
                            contactForm: .whatsapp
                        )
                    }
                    
                    dismiss()
                } label: {
                    Text("Salvar")
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.brancoNeve)
                        .padding(8)
                        .background(Color.verdeMatcha)
                        .cornerRadius(12)
                }
            }
            .padding(32)
            
            
        }
        .background(.algodaoDoce)
        .onAppear{
            if let orderModel = order {
                name = orderModel.orderName
                observation = orderModel.observation
                customerName = orderModel.customer.name
                customerContact = orderModel.customer.contact
                date = orderModel.deliveryDate
                orderItemViewModel.orderItemModels = orderModel.orderItems
            }
        }
        .onDisappear{
            orderItemViewModel.orderItemModels = []
        }
    }
}

#Preview {
    OrderCreateEditView()
}
