//
//  OrderListCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation

import SwiftUI

struct OrderListCardView: View {
    
    let getDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    let getWeekDay: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "E"
        return formatter
    }()
    
    let getHour: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    var order: OrderModel
    
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
                                    .fill(order.getStatusColor())
                                    .background()
                                    .frame(height: 20)
                                Spacer()
                            }
                        )
                    
                    VStack {
                        Text(getWeekDay.string(from: order.deliveryDate))
                            .foregroundStyle(Color("brancoNeve"))
                            .font(.footnote)
                            .bold()
                        
                        Text(getDay.string(from: order.deliveryDate))
                            .font(.custom("Ginormous", size: 36))
                            .foregroundStyle(Color("secundaria"))
                            .fontWeight(.black)
                            .padding(.top, 0)
                        
                        Text(getHour.string(from: order.deliveryDate))
                            .font(.footnote)
                            .foregroundStyle(Color("secundaria"))
                        
                    }
                }
                
                
                
                VStack (alignment: .leading) {
                    Text(order.orderName)
                        .foregroundStyle(Color("secundaria"))
                        .font(.headline)
                    
                    Text(order.observation)
                        .foregroundStyle(Color("boloDePedreiro"))
                        .font(.caption2)
                    
                    
                    
                    HStack(spacing: 0) {
                        ZStack {
                            VStack {
                                GeometryReader { geometry in
                                    Text(order.getStatusName())
                                        .foregroundStyle(order.getStatusColor())
                                        .padding(.vertical, 4)
                                        .padding(.horizontal, 12)
                                        .background(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(order.getStatusColor(), lineWidth: 1)
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
                    .fill(order.getStatusColor())
                    .frame(width: 8)
                
            }
        )
    }
}

#Preview {
    OrderListCardView(order: OrderModel.create())
}
