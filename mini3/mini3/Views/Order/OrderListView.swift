//
//  OrderListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import Foundation
import SwiftUI

struct OrderListView: View {
    @State var shouldPresentSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Cremosinho_Tab")
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .top) {
                        Image("LogoPave")
                        Spacer()
                        
                        Button() {
                            shouldPresentSheet.toggle()
                        } label: {
                            AddButtonView()
                        }
                        .sheet(isPresented: $shouldPresentSheet) {
                            print("Sheet dismissed!")
                        } content: {
                            OrderCreateEditView()
                        }
                        
                    }
                    .padding(.horizontal, 32)
                }
                Spacer()
                
                ScrollView{
                    
                    VStack(spacing: 8){
                        HStack {
                            Text("Encomendas próximas")
                                .foregroundStyle(Color("principal"))
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
                        
                        ForEach (1..<11) { index in
                            NavigationLink {
                                OrderView()
                            } label: {
                                OrderListCardView()
                            }
                        }
                        
                        Spacer()
                        
                    }
                }
                .padding(32)
                
                
                
            }
            .background(Color.algodaoDoce.edgesIgnoringSafeArea(.bottom))
        }
    }
}

#Preview {
    OrderListView()
}
