//
//  ProductView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation
import SwiftUI

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
    
    func getImageColor() -> Color? {
        switch imageName {
            case "IconeBeijinho": return Color.limaoTahiti
            case "IconeEstrela": return Color.boloDePedreiro
            case "IconeCupcake": return Color.limonada
            case "IconeCookie": return Color.picoleDeGroselha
            case "IconeBolo": return Color.geleiaDeMorango
            case "IconeBiscoito": return Color.verdeMatcha
            case "IconeBoloInteiro": return Color.amareloGema
            case "IconeBrigadeiro": return Color.musseDeMorango
            default: return nil
        }
    }
}

