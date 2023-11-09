//
//  OrderListDoneView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderListDoneView: View {
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Cremosinho_Redondo")
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .top) {
                        Text("Pedidos")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundStyle(.principal)
                        
                        
                        Spacer()
                        Button(action: {
                            print("adicionar pedido")
                        }, label: {
                            AddButtonView()
                        })
                        
                    }
                    .padding(.horizontal, 32)
                }
                
                
                VStack(spacing: 8){
                    
                    HStack {
                        Text("Todas os pedidos")
                            .foregroundStyle(Color("principal"))
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button(action: {
                            print("sort ascendente/descendente")
                        }, label: {
                            Image(systemName: "arrow.up.arrow.down.square")
                                .foregroundStyle(Color("principal"))
                        })
                        
                        Button(action: {
                            print("sort entrega, criaçao e nome")
                        }, label: {
                            Image(systemName: "line.3.horizontal.decrease.circle")
                                .foregroundStyle(Color("principal"))
                        })
                    }
                    
                    ScrollView (showsIndicators: false){
                        VStack {
                            ForEach (1..<11) { index in
                                NavigationLink {
                                    OrderView()
                                } label: {
                                    OrderListCardView()
                                }
                            }
                            
                        }
                    }
                }
                .padding(.horizontal, 32)
                .padding(.top, 32)
            }
            .background(Color.algodaoDoce.edgesIgnoringSafeArea(.bottom))
        }
    }
}

#Preview {
    OrderListDoneView()
}
