//
//  OrderCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 01/11/23.
//

import SwiftUI

struct OrderCardView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            HStack(alignment: .center, spacing: 16) {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.red)
                        .frame(width: 84, height: 84)
                        .overlay(
                            VStack {
                                UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8)
                                    .background()
                                    .frame(height: 20)
                                Spacer()
                            }
                        )
                    VStack {
                        Text("QUA")
                            .font(.footnote)
                            .bold()
                        
                        Text("30")
                            .font(.custom("Ginormous", size: 36))
                            .fontWeight(.black)
                            .padding(.top, 0)
                           
                        Text("20:00")
                            .font(.footnote)
                        
                    }
                }

                
                
                VStack (alignment: .leading) {
                    Text("Aniversário Nicole")
                        .font(.headline)
                    
                    Text("50 un. brigadeiro, 50 un. beijinho, 1kg bolo de chocolate")
                        .font(.caption2)
                        .frame(maxWidth: 200)
                    

                    
                    HStack(spacing: 0) {
                        ZStack {
                                VStack {
                                    GeometryReader { geometry in
                                    Text("Embalando")
                                        .padding(.horizontal, 12)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(.red, lineWidth: 2)
                                        )
                                        .frame(width: geometry.size.width, height: 28, alignment: .leading)
                                }
                                
                            }
                        }

                        .font(.footnote)
                        .fontWeight(.semibold)
                        
                        Spacer()
                            .frame(maxWidth: .infinity)
                    }
                }
                
          
            }
            .frame(alignment: .center)

            .padding(12)
            
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: 104)
        .background(.thickMaterial)
        .cornerRadius(8)
        .overlay(
            HStack {
                Spacer()
                UnevenRoundedRectangle(bottomTrailingRadius: 8, topTrailingRadius: 8)
                    .foregroundStyle(.red) //cor aqui
                    .frame(width: 8)

            }
        )
//        .padding(32)
        
        
    }
}

#Preview {
    OrderCardView()
}
