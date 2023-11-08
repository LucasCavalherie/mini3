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
            ScrollView{
                ZStack{
                    VStack {
                        ZStack {
                            Image("Cremosinho_Tab")
                                .resizable()
                            
                            HStack(alignment: .top) {
                                Image("LogoPave")
                                Spacer()
                                Button(action: {
                                    print("adicionar pedido")
                                }, label: {
                                    Image(systemName: "plus.app.fill")
                                        .font(.title)
                                        .foregroundStyle(.yellow)
                                    
                                })
                                
                            }
                            .padding(.horizontal, 32)
                        }
                        Spacer()
                        
                        VStack(spacing: 8){
                            HStack {
                                Text("Encomendas próximas")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            NavigationLink {
                                OrderView()
                            } label: {
                                OrderListCardView()
                            }
                            
                            NavigationLink {
                                OrderView()
                            } label: {
                                OrderListCardView()
                            }
                            
                            Spacer()
                                .frame(height: 20)
                            
                            HStack {
                                Text("Todas as encomendas")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Spacer()
                                
                                Button(action: {
                                    print("sort ascendente/descendente")
                                }, label: {
                                    Image(systemName: "arrow.up.arrow.down.square")
                                })
                                
                                Button(action: {
                                    print("sort entrega, criaçao e nome")
                                }, label: {
                                    Image(systemName: "line.3.horizontal.decrease.circle")
                                })
                                
                                
                            }
                            OrderListCardView()
                            
                            Spacer()
                        }
                        .padding(32)
                    }
                    
                }
            }
            .background(Color.gray)
        }
    }
}

#Preview {
    OrderListView()
}
