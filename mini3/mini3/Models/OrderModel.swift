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
    case toBeDelivered
    case delivered
    case canceled
    case concluded
}

struct OrderModel: Identifiable {
    var id: UUID = UUID()
    var orderName: String
    var deliveryDate: String
    var observation: String
    var isPaid: Bool
    var status: OrderStatus
}
