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
    
    var products : [ProductModel] = []
    var currentProduct : ProductModel?
    
    func sortProducts() {
        products.sort()
    }
    
    func addProduct(name: String, observation: String?, priceBase: Float, createdAt: Date) {
        products.append(ProductModel(name: name, observation: observation, priceBase: priceBase, createdAt: createdAt))
        sortProducts()
    }
    
    func editProduct(id: UUID, name: String, observation: String?, priceBase: Float, createdAt: Date) {
        if let index = products.firstIndex(where: { $0.id == id }) {
            products[index].name = name
            products[index].observation = observation
            products[index].priceBase = priceBase
            products[index].createdAt = createdAt
        }
    }
    
    func getProduct(id: UUID) -> ProductModel? {
        return products.filter{$0.id == id}.first
    }
    
    func listProducts() -> [ProductModel] {
        return products
    }
    
}

