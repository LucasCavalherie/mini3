//
//  OrderCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 01/11/23.
//

import SwiftUI

struct OrderCardView: View {
    var body: some View {
        
        VStack {
            HStack {
                
                Image("cook")
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal, 8)
                
                VStack (alignment: .leading) {
                    Text("Aniversário Nicole")
                        .font(.headline)
                    
                    Text("50 un. brigadeiro, 50 un. beijinho, 1kg bolo de chocolate")
                        .font(.caption2)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text("Qua, 13 OUT")
                        Text("|")
                        Image(systemName: "clock")
                        Text("14:00")
                    }
                    .font(.caption)
                    .fontWeight(.semibold)
                }
                .padding(.vertical, 8)
                .padding(.trailing)
                
            }
            .padding(.top, 8)
            
            Color.brown
                .frame(height: 8) // Altura da borda
            
        }
        .frame(height: 125)
        .background(.thickMaterial)
        .cornerRadius(8)
        .padding()
        
        
    }
}

#Preview {
    OrderCardView()
}
