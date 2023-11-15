//
//  OrderStatusListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderStatusListView: View {
    @State private var currentPosition = 0
    
    // Placeholder system colors for each status
    let statusColors: [Color] = [.chocolateMeioAmargo, .amareloGema, .geleiaDeMorango, .verdeMatcha, .limaoTahiti]
    
    // Placeholder text for each status
    let statusTexts: [String] = ["A fazer", "Fazendo", "Embalando", "A entregar", "Concluído"]
    
    // Secondary color for circles
    @State private var currentSecondaryColor: Color = .chocolateAoLeite
    let secondaryColors: [Color] = [.chocolateAoLeite, .cascaDeOvo, .musseDeMorango, .matchaLatte, .limonada]
    
    var body: some View {
        VStack {
            ZStack {
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 12)
                    .foregroundStyle(currentSecondaryColor)
                    .opacity(0.5)
                    .padding(.horizontal, 32)
                    .animation(.default, value: currentPosition)
                
                HStack(spacing: 25) {
                    ForEach(0..<5) { index in
                        ZStack {
                            if index == currentPosition {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(width: 64, height: 64)
                                    .foregroundStyle(statusColors[index])
                                    .zIndex(0)
                                    .animation(.smooth, value: currentPosition)
                                
                                Image("Status_\(index + 1)")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                    .zIndex(1)
                                    .animation(.smooth, value: currentPosition)
                            } else {
                                Circle()
                                    .frame(width: 42)
                                    .foregroundStyle(currentSecondaryColor)
                                    .zIndex(0)
                                    .animation(.smooth, value: currentPosition)
                            }
                        }
                    }
                }
            }
            
            HStack {
                Button {
                    if currentPosition > 0 {
                        currentPosition -= 1
                        currentSecondaryColor = secondaryColors[currentPosition]
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.background)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.picoleDeGroselha)
                        .cornerRadius(12)
                }
                
                Spacer()
                
                Text(statusTexts[currentPosition])
                    .foregroundStyle(Color.secundaria)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    if currentPosition < 4 {
                        currentPosition += 1
                        currentSecondaryColor = secondaryColors[currentPosition]
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.background)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.picoleDeGroselha)
                        .cornerRadius(12)
                }
            }
            .padding(32)
        }
    }
}

#Preview {
    OrderStatusListView()
}
