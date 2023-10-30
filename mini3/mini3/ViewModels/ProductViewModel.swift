//
//  ProductViewModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 30/10/23.
//

import Foundation

class ProductViewModel: ObservableObject {
    static let shared = ProductViewModel()
    
    private init() {}
    
    let sharedUserDefaults = UserDefaults()
    let productKey = "products"
    
    var orders : [ProductModel] = []
    var currentProduct : ProductModel?
    
    
    
}

