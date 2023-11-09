//
//  OrderListCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation

import SwiftUI

struct OrderListCardView: View {
    var body: some View {
        
        VStack(alignment: .center) {
            Spacer()
            
            HStack(alignment: .center, spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("cocadaCinzenta"))
                        .frame(width: 84, height: 84)
                        .overlay(
                            VStack {
                                UnevenRoundedRectangle(topLeadingRadius: 8, topTrailingRadius: 8)
                                    .fill(Color("verdeMatcha"))
                                    .background()
                                    .frame(height: 20)
                                Spacer()
                            }
                        )
                    
                    VStack {
                        Text("QUA")
                            .foregroundStyle(Color("brancoNeve"))
                            .font(.footnote)
                            .bold()
                        
                        Text("30")
                            .font(.custom("Ginormous", size: 36))
                            .foregroundStyle(Color("secundaria"))
                            .fontWeight(.black)
                            .padding(.top, 0)
                        
                        Text("20:00")
                            .font(.footnote)
                            .foregroundStyle(Color("secundaria"))
                        
                    }
                }
                
                
                
                VStack (alignment: .leading) {
                    Text("Aniversário Nicole")
                        .foregroundStyle(Color("secundaria"))
                        .font(.headline)
                    
                    Text("50 un. brigadeiro, 50 un. beijinho, 1kg bolo de chocolate")
                        .foregroundStyle(Color("boloDePedreiro"))
                        .font(.caption2)
                        .frame(maxWidth: 150)
                    
                    
                    
                    HStack(spacing: 0) {
                        ZStack {
                            VStack {
                                GeometryReader { geometry in
                                    Text("Embalando")
                                        .foregroundStyle(Color.verdeMatcha)
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 12)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color("verdeMatcha"), lineWidth: 1)
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
        .background(Color("brancoNeve"))
        .cornerRadius(8)
        .overlay(
            HStack {
                Spacer()
                UnevenRoundedRectangle(bottomTrailingRadius: 8, topTrailingRadius: 8)
                    .fill(Color("verdeMatcha"))
                    .frame(width: 8)
                
            }
        )
    }
}

#Preview {
    OrderListCardView()
}
