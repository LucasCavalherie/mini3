//  OnboardingView.swift
//  mini3
//
//  Created by Gustavo Sena on 12/11/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var selected = 0
    
    var body: some View {
        VStack(spacing: 0) {
            VStack {
                HStack(alignment: .center, spacing: 12) {
                    ForEach(0..<3) { index in
                        Circle()
                            .fill(index == selected ? Color(.chocolateMeioAmargo) : Color.clear)
                            .overlay(
                                Circle()
                                    .stroke(lineWidth: 2)
                                    .foregroundColor(Color(.chocolateMeioAmargo))
                                    .opacity(index == selected ? 0 : 1)
                            )
                            .frame(width: 16, height: 16)
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 20)
                .animation(.bouncy, value: selected)
            }
            .frame(maxHeight: 48)
            .background(.algodaoDoce)
            
            TabView(selection: $selected) {
                ForEach(0..<3) { index in
                    VStack {
                        Spacer()
                        
                        Image("Pavinho_Onboarding_\(index + 1)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 372)
                        
                        VStack {
                            if selected == 0 {
                                Text("Boas-vindas ao Pavê")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.principal)
                            } else if selected == 1 {
                                Text("Organize suas encomendas")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.principal)
                            } else if selected == 2 {
                                Text("Acompanhe seu progresso")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundStyle(.principal)
                            }
                            
                            if selected == 0 {
                                Text("Chegou a hora de abandonar o bloco de notas! O Pavê nasceu para simplificar a organização do confeiteiro independente.")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.secundaria)
                            } else if selected == 1 {
                                Text("Conte com o acesso rápido a todos os detalhes dos seus pedidos e produtos na palma da sua mão.")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.secundaria)
                            } else if selected == 2 {
                                Text("Confira todo o seu histórico de vendas em poucos cliques e descubra quais são os produtos favoritos dos seus clientes!")
                                    .font(.subheadline)
                                    .multilineTextAlignment(.center)
                                    .foregroundStyle(.secundaria)
                            }
                        }
                        .padding(32)
                        
                        Spacer()
                    }
                    .background(.algodaoDoce)
                    .ignoresSafeArea(edges: .bottom)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .background(.algodaoDoce)
            .ignoresSafeArea(edges: .bottom)
            .animation(.easeInOut, value: selected)
            
            VStack {
                ZStack {
                    Image("Cremosinho_Onboarding")
                        .resizable()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .scaledToFill()
                    
                    HStack(alignment: .top) {
                        Button(action: {
                            print("pular")
                        }, label: {
                            Text("Pular")
                                .font(.headline)
                                .foregroundStyle(.secundaria)
                        })
                        Spacer()
                        Button(action: {
                            // Increment to the next tab
                            selected = min(selected + 1, 2)
                        }, label: {
                            Text("Próximo")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.verdeMatcha)
                        })
                    }
                    .padding(.horizontal, 32)
                }
            }
            .frame(maxHeight: 72)
            .background(.algodaoDoce)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
