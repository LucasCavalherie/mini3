//
//  OrderModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation
import SwiftUI

enum OrderStatus: Codable {
    case toDo
    case doing
    case packing
    case toDeliver
    case done
    case canceled
}

struct OrderModel: Identifiable, Codable {
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
            case .toDeliver:
                return "A Entregar"
            case .done:
                return "Feito"
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
            case .toDeliver:
                return .verdeMatcha
            case .done:
                return .limaoTahiti
            case .canceled:
                return .picoleDeGroselha
        }
    }
    
    func getSecondaryStatusColor() -> Color {
        switch status {
            case .toDo:
                return .chocolateAoLeite
            case .doing:
                return .cascaDeOvo
            case .packing:
                return .musseDeMorango
            case .toDeliver:
                return .matchaLatte
            case .done:
                return .limonada
            case .canceled:
                return .geleiaDeMorango
        }
    }
    
    func getStatusValue() -> Int {
        switch status {
            case .toDo: return 0
            case .doing: return 1
            case .packing: return 2
            case .toDeliver: return 3
            case .done: return 4
            case .canceled: return 5
        }
    }
}
