//
//  OrderAddItemView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 10/11/23.
//

import SwiftUI

struct OrderAddItemView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel.shared
    
    var body: some View {
        VStack {
            HStack {
                Text("Selecionar produto")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.principal)
                
                Spacer()
                
                Button {
                    dismiss()
                } label: {
                    CloseButtonView()
                }
                
            }
            .padding(.top, 32)
            .padding(.horizontal, 32)
            
            VStack (alignment: .leading) {
                
                ScrollView (showsIndicators: false) {
                    ForEach (viewModel.listProducts()) { product in
                        ProductCardAddView(product: product)
                    }
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Salvar")
                        .frame(maxWidth: .infinity)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.brancoNeve)
                        .padding(8)
                        .background(Color.verdeMatcha)
                        .cornerRadius(12)
                }
            }
            .padding(32)
            
            
        }
        .background(.algodaoDoce)
    }
}

#Preview {
    OrderAddItemView()
}
