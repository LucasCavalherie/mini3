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
    @EnvironmentObject
    private var purchaseManager: PurchaseManager

    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            VStack {
                Text("Ah não!")
                    .font(.title)

                Text("Parece que você atingiu o seu limite de pedidos")
                    .padding(.horizontal, 32)
                    .multilineTextAlignment(.center)
            }
            .font(.callout)
            .fontWeight(.bold)
            .foregroundStyle(.picoleDeGroselha)
            
            Image("Pavinho_Triste")
            
            Text("Tenha acesso ilimitado ao Pavê com a Versão Pro")
                .padding(.horizontal, 32)
                .multilineTextAlignment(.center)
                .font(.callout)
                .fontWeight(.bold)
                .foregroundStyle(.picoleDeGroselha)
            
            ForEach(purchaseManager.products) { product in
                Text("Por apenas: \(product.displayPrice)")
                    .padding(.horizontal, 32)
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(.picoleDeGroselha)
                
                Button {
                    Task {
                        do {
                            try await purchaseManager.purchase(product)
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Compre agora")
                        .foregroundColor(.brancoNeve)
                        .fontWeight(.bold)
                        .padding()
                        .background(.picoleDeGroselha)
                        .clipShape(Capsule())
                }
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
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
