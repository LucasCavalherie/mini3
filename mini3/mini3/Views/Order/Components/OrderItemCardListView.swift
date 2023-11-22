//
//  OrderItemsListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(Color.geleiaDeMorango)
                    .font(.title)
                configuration.label
            }
        })
    }
}

struct OrderItemCardListView: View {
    @State var orderItem : OrderItemModel
    
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel.shared
    @ObservedObject var orderViewModel: OrderViewModel = OrderViewModel.shared
    
    var body: some View {
        HStack {
            VStack {
                Text("\(orderItem.quantity)")
                    .fontWeight(.bold)
                Text("un.")
                    .font(.caption2)
            }
            .foregroundStyle(.background)
            .padding()
            .background(Color.geleiaDeMorango)
            
            Text("\(viewModel.getProduct(id: orderItem.productId)?.name ?? "")")
            
            Spacer()
            
            Toggle(isOn: $orderItem.done){}
                .toggleStyle(iOSCheckboxToggleStyle())
        }
        .padding(.trailing)
        .background(Color.brancoNeve)
        .cornerRadius(8)
        .padding(.horizontal)
        .onChange(of: orderItem.done) { _, done in
            orderViewModel.orderItemDone(id: orderItem.id, done: orderItem.done)
        }
    }
}

#Preview {
    OrderItemCardListView(orderItem: OrderItemModel(productId: UUID(), quantity: 10, done: true))
}
