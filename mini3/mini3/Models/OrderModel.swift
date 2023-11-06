//
//  OrderModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation

enum OrderStatus {
    case toDo
    case doing
    case packing
    case done
    case toDeliver
    case canceled
}

struct OrderModel: Identifiable {
    var id: UUID = UUID()
    var orderName: String
    var deliveryDate: Date
    var observation: String
    var value: Double
    var isPaid: Bool
    var status: OrderStatus
    var customer: CustomerModel
    var orderItems: [OrderItemModel]
}
