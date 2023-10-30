//
//  OrderViewModel.swift
//  mini3
//
//  Created by Lucas Cavalherie on 30/10/23.
//

import Foundation

class OrderViewModel: ObservableObject {
    static let shared = OrderViewModel()
    
    private init() {}
    
    let sharedUserDefaults = UserDefaults()
    let orderKey = "order"
    
    var orders : [OrderModel] = []
    var currentOrder : OrderModel?
    
    
    
}
