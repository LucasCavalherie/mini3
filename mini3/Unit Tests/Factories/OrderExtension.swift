//
//  OrderModelMock.swift
//  mini3
//
//  Created by Lucas Cavalherie on 06/11/23.
//

import Foundation

extension OrderModel {
    static func create(
        orderName: String = "",
        deliveryDate: Date = Date(),
        observation: String = "",
        value: Double = 10.0,
        isPaid: Bool = true,
        status: OrderStatus = .toDo,
        customer: CustomerModel = CustomerModel(name: "nome", contact: "contato", contactForm: .instagram),
        orderItems: [OrderItemModel] = []
    ) -> OrderModel {
        return OrderModel(
            orderName: orderName,
            deliveryDate: deliveryDate,
            observation: observation,
            value: value,
            isPaid: isPaid,
            status: status,
            customer: customer,
            orderItems: orderItems
        )
    }
}

