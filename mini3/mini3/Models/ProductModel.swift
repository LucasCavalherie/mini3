//
//  ProductView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation

struct ProductModel: Identifiable, Comparable, Codable {
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var observation: String?
    var priceBase: Float
    var createdAt: Date
    
    static func < (lhs: ProductModel, rhs: ProductModel) -> Bool {
        return lhs.name < rhs.name
    }
}

