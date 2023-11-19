//
//  ProductCardAddView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductCardAddView: View {
    @State var value = false
    
    var product : ProductModel
    @ObservedObject var orderItemViewModel: OrderItemViewModel = OrderItemViewModel.shared

    var body: some View {
        HStack {
            Toggle(isOn: $value) {
                HStack {
                    VStack {
                        Image(product.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 45)
                    }
                    .foregroundStyle(.background)
                    .padding(8)
                    .background(product.getImageColor())
                    
                    Text(product.name)
                        .font(.headline)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.secundaria)
                        .padding(.horizontal)
                    
                }
            }
            .padding(.trailing)
        }
        .background(Color.brancoNeve)
        .cornerRadius(8)
        .onChange(of: value) { _, newValue in
            if newValue {
                orderItemViewModel.addOrderItem(productId: product.id, quantity: 0)
            } else {
                orderItemViewModel.removeOrderItemByProductId(productId: product.id)
            }
        }
    }
}

#Preview {
    ProductCardAddView(product: ProductModel(name: "", imageName: "IconeBrigadeiro", priceBase: 10, createdAt: Date.now))
}
