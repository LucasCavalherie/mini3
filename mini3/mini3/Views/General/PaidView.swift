//
//  PaidView.swift
//  Pave
//
//  Created by Lucas Cavalherie on 28/11/23.
//

import Foundation
import SwiftUI
import StoreKit

struct PaidView: View {
    
    @EnvironmentObject private var purchaseManager: PurchaseManager
    
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(alignment: .leading) {
            
            Image("pavePlus")
                .resizable()
                .scaledToFill()
            
            Spacer()
            
            VStack (alignment: .leading){
                VStack (alignment: .leading) {
                    Text("Adquira o Pavê+")
                        .font(.title)
                        .foregroundStyle(.principal)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    Text("Parabéns por atingir 20 pedidos! Para continuar")
                        .font(.subheadline)
                        .foregroundStyle(.secundaria)
                    Text("a sua jornada na confeitaria com pedidos")
                        .font(.subheadline)
                        .foregroundStyle(.secundaria)
                    Text("ilimitados, adquira o Pavê+")
                        .font(.subheadline)
                        .foregroundStyle(.secundaria)
                }
                .padding(.vertical, 32)
                
                VStack (alignment: .leading) {
                    Text("Benefícios do Pavê+")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.principal)
                    
                    HStack {
                        VStack (alignment: .leading){
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.geleiaDeMorango)
                                        .frame(width: 40, height: 40) // Ajuste o tamanho conforme necessário

                                    Image(systemName: "list.number")
                                        .font(.title2)
                                        .foregroundColor(.brancoNeve)
                                }
                                
                                Text("Pedidos ilimitados")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secundaria)
                            }
                            
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.geleiaDeMorango)
                                        .frame(width: 40, height: 40) // Ajuste o tamanho conforme necessário

                                    Image(systemName: "dollarsign.circle")
                                        .font(.title2)
                                        .foregroundColor(.brancoNeve)
                                }
                                
                                Text("Pague apenas uma vez")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secundaria)
                            }
                            
                            HStack {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color.geleiaDeMorango)
                                        .frame(width: 40, height: 40) // Ajuste o tamanho conforme necessário

                                    Image(systemName: "envelope")
                                        .font(.title2)
                                        .foregroundColor(.brancoNeve)
                                }
                                
                                Text("Suporte prioritário")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.secundaria)
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .background(.brancoNeve)
                    .cornerRadius(12)
                }
                .padding(.bottom)
                
                
                ForEach(purchaseManager.products) { product in
                    Text("Pagamento Único - \(product.displayPrice)")
                        .frame(maxWidth: .infinity)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.secundaria)
                        .padding(.vertical, 8)
                    
                    Button {
                        Task {
                            do {
                                try await purchaseManager.purchase(product)
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        Text("Comprar")
                            .font(.title3)
                            .foregroundColor(.brancoNeve)
                            .fontWeight(.semibold)
                            .padding()
                    }
                    .frame(maxWidth: .infinity)
                    .background(.verdeMatcha)
                    .cornerRadius(12)
                    
                    Button {
                        Task {
                            do {
                                try await AppStore.sync()
                            } catch {
                                print(error)
                            }
                        }
                    } label: {
                        Text("Restaurar Comprar")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.verdeMatcha)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                }
                
            }
            .padding(.horizontal, 32)
            
            Spacer()
        }
        .background(.algodaoDoce)
        .task {
            Task {
                do {
                    try await purchaseManager.loadProducts()
                } catch {
                    print(error)
                }
            }
        }
    }
}

#Preview {
    PaidView()
        .environmentObject(PurchaseManager())
//        .task {
//            await PurchaseManager().updatePurchasedProducts()
//        }
}
