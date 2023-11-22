//
//  ProductListCardView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductListCardView: View {
    var product : ProductModel
    
    var body: some View {
        HStack {
            VStack {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 60)
            }
            .foregroundStyle(.background)
            .padding(8)
            .background(product.getImageColor())
            
            VStack (alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                    .foregroundStyle(Color.secundaria)
                
                Text(product.observation ?? "")
                    .font(.caption2)
                    .foregroundStyle(Color.chocolateAoLeite)
            }
            .padding(.horizontal)
           
            
            Spacer()
        }
        .padding(.trailing)
        .background(Color.brancoNeve)
        .cornerRadius(8)
    }
}

#Preview {
    ProductListCardView(product: ProductModel(name: "Produto", imageName: "IconeBoloInteiro", observation: "Obs", priceBase: 10, createdAt: Date.now))
}
