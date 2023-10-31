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
    
    @Published var products : [ProductModel] = []
    @Published var currentProduct : ProductModel?
    
    func sortProducts() {
        products.sort()
    }
    
    func getProductIndex(id: UUID) -> Int? {
        return products.firstIndex(where: { $0.id == id })
    }
    
    func addProduct(name: String, observation: String?, priceBase: Float, createdAt: Date) {
        products.append(ProductModel(name: name, observation: observation, priceBase: priceBase, createdAt: createdAt))
        sortProducts()
    }
    
    func editProduct(id: UUID, name: String, observation: String?, priceBase: Float, createdAt: Date) {
        if let index = getProductIndex(id: id) {
            products[index].name = name
            products[index].observation = observation
            products[index].priceBase = priceBase
            products[index].createdAt = createdAt
        }
    }
    
    func removeProduct(id: UUID) {
        if let index = getProductIndex(id: id) {
            products.remove(at: index)
        }
    }
    
    func getProduct(id: UUID) -> ProductModel? {
        return products.filter{$0.id == id}.first
    }
    
    func listProducts() -> [ProductModel] {
        return products
    }
    
}

