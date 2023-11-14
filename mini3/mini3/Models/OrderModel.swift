//
//  OrderModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation
import SwiftUI

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
    
    func getStatusName() -> String {
        switch status {
            case .toDo:
                return "A Fazer"
            case .doing:
                return "Fazendo"
            case .packing:
                return "Embalando"
            case .done:
                return "Feito"
            case .toDeliver:
                return "A Entregar"
            case .canceled:
                return "Cancelado"
        }
    }
    
    func getStatusColor() -> Color {
        switch status {
            case .toDo:
                return .chocolateMeioAmargo
            case .doing:
                return .amareloGema
            case .packing:
                return .geleiaDeMorango
            case .done:
                return .limaoTahiti
            case .toDeliver:
                return .verdeMatcha
            case .canceled:
                return .picoleDeGroselha
        }
    }
}
