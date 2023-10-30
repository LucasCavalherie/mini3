//
//  ProductView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation

struct ProductModel: Identifiable {
    var id: UUID = UUID()
    var name: String
    var observation: String
    var priceBase: Float
}

