//
//  OrderStatusListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderStatusListView: View {
    var body: some View {
        HStack (spacing: 25) {
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color.geleiaDeMorango)
            
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color.geleiaDeMorango)
            
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color.geleiaDeMorango)
            
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color.geleiaDeMorango)
            
            Circle()
                .frame(width: 45)
                .foregroundStyle(Color.geleiaDeMorango)
        }
    }
}

#Preview {
    OrderStatusListView()
}
