//
//  ProductViewModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 30/10/23.
//

import Foundation

class ProductViewModel: ObservableObject {
    static let shared = ProductViewModel()
    
    private init() {
        loadProducts()
    }
    
    @Published var products : [ProductModel] = [] { didSet { saveProducts() } }
    @Published var currentProduct : ProductModel?
    
    // Saving Data
    let sharedUserDefaults = UserDefaults.standard
    let productKey = "products"

    private func loadProducts() {
        if let data = sharedUserDefaults.data(forKey: productKey),
           let decodedOrders = try? JSONDecoder().decode([ProductModel].self, from: data) {
            products = decodedOrders
        }
    }

    private func saveProducts() {
        if let encodedOrders = try? JSONEncoder().encode(products) {
            sharedUserDefaults.set(encodedOrders, forKey: productKey)
        }
    }
    
    func clearProducts() {
        sharedUserDefaults.removeObject(forKey: productKey)
        products = []
    }
    
    // Functions
    
    func sortProducts() {
        products.sort()
    }
    
    func getProductIndex(id: UUID) -> Int? {
        return products.firstIndex(where: { $0.id == id })
    }
    
    func addProduct(name: String, imageName: String, observation: String?, priceBase: Float, createdAt: Date) {
        products.append(ProductModel(name: name, imageName: imageName, observation: observation, priceBase: priceBase, createdAt: createdAt))
        sortProducts()
    }
    
    func editProduct(id: UUID, name: String, imageName: String, observation: String?, priceBase: Float) {
        if let index = getProductIndex(id: id) {
            products[index].name = name
            products[index].imageName = imageName
            products[index].observation = observation
            products[index].priceBase = priceBase
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
    
    func getTotalSales(id: UUID) -> Int {
        if getProduct(id: id) != nil {
            let orders = OrderViewModel.shared.orders.filter { order in
                return order.status == .done && order.orderItems.contains(where: { $0.productId == id })
            }
            
            let totalQuantity = orders.reduce(0) { result, order in
                let quantityForProduct = order.orderItems.filter { $0.productId == id }.map { $0.quantity }.reduce(0, +)
                return result + quantityForProduct
            }
            
            return totalQuantity
        }
        
        return 0
    }
    
}

