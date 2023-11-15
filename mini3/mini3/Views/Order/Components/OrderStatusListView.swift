//
//  OrderStatusListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI


//HStack {
//    Text(order.getStatusName())
//        .foregroundStyle(Color.secundaria)
//        .font(.title3)
//        .fontWeight(.bold)
//    
//    Spacer()
//    
//    if order.status != .canceled {
//        Button {
//            viewModel.previousStatus()
//            updateOrder()
//        } label: {
//            Image(systemName: "arrow.uturn.backward")
//                .foregroundStyle(.background)
//                .fontWeight(.bold)
//                .padding()
//                .background(Color.picoleDeGroselha)
//                .cornerRadius(12)
//        }
//    }
//    
//    if order.status != .canceled {
//        Button {
//            viewModel.nextStatus()
//            updateOrder()
//        } label: {
//            Text("Avançar")
//                .foregroundStyle(.background)
//                .fontWeight(.bold)
//                .padding()
//                .background(Color.limaoTahiti)
//                .cornerRadius(12)
//        }
//    }
//}
//.padding(.horizontal)

struct OrderStatusListView: View {
    @State private var currentPosition = 0
    @State var order : OrderModel
    
    @ObservedObject var viewModel: OrderViewModel = OrderViewModel.shared
    
    var body: some View {
        VStack {
            if currentPosition < 5 {
                ZStack {
                    
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 12)
                        .foregroundStyle(order.getSecondaryStatusColor())
                        .opacity(0.5)
                        .padding(.horizontal, 32)
                        .animation(.default, value: currentPosition)
                    
                    HStack(spacing: 25) {
                        ForEach(0..<5) { index in
                            ZStack {
                                if index == currentPosition {
                                    RoundedRectangle(cornerRadius: 16)
                                        .frame(width: 64, height: 64)
                                        .foregroundStyle(order.getStatusColor())
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
                                        .foregroundStyle(order.getSecondaryStatusColor())
                                        .zIndex(0)
                                        .animation(.smooth, value: currentPosition)
                                }
                            }
                        }
                    }
                }
            }
            
            HStack {
                if currentPosition < 5 {
                    Button {
                        if currentPosition > 0 {
                            viewModel.previousStatus()
                            order = viewModel.currentOrder!
                            currentPosition -= 1
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.background)
                            .fontWeight(.bold)
                            .padding()
                            .background(Color.picoleDeGroselha)
                            .cornerRadius(12)
                    }
                }
                
                Spacer()
                
                Text(order.getStatusName())
                    .foregroundStyle(Color.secundaria)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Spacer()
                
                if currentPosition < 5 {
                    Button {
                        if currentPosition < 4 {
                            viewModel.nextStatus()
                            order = viewModel.currentOrder!
                            currentPosition += 1
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
            }
            .padding(32)
        }
        .onAppear{
            currentPosition = order.getStatusValue()
        }
    }
}

#Preview {
    OrderStatusListView(order: OrderModel.create())
}
