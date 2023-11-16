//
//  DebugView.swift
//  Pave
//
//  Created by Lucas Cavalherie on 15/11/23.
//

import SwiftUI

struct DebugView: View {
    
    @ObservedObject var mainViewModel: MainViewModel = MainViewModel.shared
    @ObservedObject var orderViewModel: OrderViewModel = OrderViewModel.shared
    @ObservedObject var productViewModel: ProductViewModel = ProductViewModel.shared
    
    var body: some View {
        VStack {
            Button {
                mainViewModel.clearOnboarding()
            } label: {
                Text("Limpar Main")
            }
            
            Button {
                orderViewModel.clearOrders()
            } label: {
                Text("Limpar Pedidos")
            }
            
            Button {
                productViewModel.clearProducts()
            } label: {
                Text("Limpar Produtos")
            }
        }
    }
}

#Preview {
    DebugView()
}
