//
//  OrderItemViewModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 31/10/23.
//

import Foundation

class OrderItemViewModel: ObservableObject {
    static let shared = OrderItemViewModel()
    
    private init() {}
    
    @Published var orderItemModels : [OrderItemModel] = []
    
    func addOrderItem(productId: UUID, quantity: Int) {
        orderItemModels.append(OrderItemModel(productId: productId, quantity: quantity))
    }
    
    func editOrderItem(id: UUID, quantity: Int) {
        if let index = orderItemModels.firstIndex(where: { $0.id == id }) {
            orderItemModels[index].quantity = quantity
        }
    }
    
    func removeOrderItemByProductId(productId: UUID) {
        if let index = orderItemModels.firstIndex(where: { $0.productId == productId }) {
            orderItemModels.remove(at: index)
        }
    }
    
    func listOrderItem() -> [OrderItemModel] {
        return orderItemModels
    }
    
}
