//
//  OrderItemModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 30/10/23.
//

import Foundation

struct OrderItemModel: Identifiable, Codable {
    var id: UUID = UUID()
    var productId: UUID
    var quantity: Int
    var done: Bool = false
}

