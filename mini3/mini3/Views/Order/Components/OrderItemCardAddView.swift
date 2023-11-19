//
//  OrderItemCardAddView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderItemCardAddView: View {
    var orderItem: OrderItemModel
    @State var quantity: Int = 0
    
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel.shared
    @ObservedObject var orderItemViewModel: OrderItemViewModel = OrderItemViewModel.shared
    
    var body: some View {
        HStack {
            Stepper(value: $quantity) {
                HStack {
                    VStack {
                        Image(viewModel.getProduct(id: orderItem.productId)?.imageName ?? "")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 45)
                    }
                    .foregroundStyle(.background)
                    .padding(8)
                    .background(viewModel.getProduct(id: orderItem.productId)?.getImageColor())
                    
                    Text(viewModel.getProduct(id: orderItem.productId)?.name ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.secundaria)
                    
                    
                    
                    Spacer()
                    
                    Text("\(orderItem.quantity)")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.picoleDeGroselha)
                        .padding(.trailing)
                }
                .background(Color.brancoNeve)
                .cornerRadius(8)
            }
        }
        .onChange(of: quantity) { _, quantity in
            orderItemViewModel.editOrderItem(id: orderItem.id, quantity: quantity)
        }
        
        
    }
}

#Preview {
    OrderItemCardAddView(orderItem: OrderItemModel(productId: UUID(), quantity: 1))
}
