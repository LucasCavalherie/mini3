//
//  OrderListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation
import SwiftUI

struct OrderListView: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    OrderView()
                } label: {
                    Text("Ver pedido")
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    OrderListView()
}
