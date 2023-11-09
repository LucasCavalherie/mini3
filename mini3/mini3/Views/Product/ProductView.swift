//
//  ProductView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            
            ZStack {
                VStack {
                    Spacer()
                    
                    Image("Cremosinho_Embaixo")
                        .resizable()
                        .scaledToFit()
                }
                
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        Image("Sacola")
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Bolo de Chocolate")
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.principal)
                                
                                Text("Notas sobre o produto")
                                    .font(.subheadline)
                                    .foregroundStyle(.principal)
                            }
                            .padding()
                            
                            Spacer()
                        }
                        .padding()
                        
                        
                        VStack {
                            HStack {
                                Text("Já foram vendidos")
                                    .foregroundStyle(.principal)
                                
                                Spacer()
                                
                                Text("102")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.geleiaDeMorango)
                                
                                Text("un")
                                    .foregroundStyle(.geleiaDeMorango)
                            }
                            .padding(.top)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.geleiaDeMorango),
                                alignment: .bottom
                            )
                            
                            HStack {
                                Text("Valor do Produto")
                                    .foregroundStyle(.principal)
                                
                                Spacer()
                                
                                Text("R$")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.geleiaDeMorango)
                                
                                Text("102")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.geleiaDeMorango)
                            }
                            .padding(.top)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.geleiaDeMorango),
                                alignment: .bottom
                            )
                        }
                        .padding(.horizontal, 32)
                    }
                    .padding(.top)
                    
                    Spacer()
                }
            }
        }
        .background(Color.geleiaDeMorango.edgesIgnoringSafeArea(.top))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.brancoNeve)
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                
                HStack {
                    Image(systemName: "square.and.pencil")
                        .foregroundStyle(Color.brancoNeve)
                        .font(.body)
                        .fontWeight(.semibold)
                        .padding(.trailing)
                    
                    Image(systemName: "trash.fill")
                        .foregroundStyle(Color.brancoNeve)
                        .font(.body)
                        .fontWeight(.semibold)
                }
                .padding(.trailing, 8)
                
            }
        }
    }
}

#Preview {
    ProductView()
}
