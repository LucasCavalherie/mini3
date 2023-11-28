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
    
    @State var shouldPresentSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Text("Selecionar produto")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.principal)
                
                Spacer()
                
                Button() {
                    shouldPresentSheet.toggle()
                } label: {
                    AddButtonView()
                }
                .sheet(isPresented: $shouldPresentSheet) {
                    print("Sheet dismissed!")
                } content: {
                    ProductCreateEditView()
                }
                
                Button {
                    dismiss()
                } label: {
                    CloseButtonView()
                }
                
            }
            .padding(.top, 32)
            .padding(.horizontal, 32)
            
            VStack (alignment: .center) {
                
                if viewModel.listProducts().count == 0 {
                    VStack {
                        Spacer()
                        Image("Pavinho_Triste")
                            .padding(16)
                        VStack {
                            Text("Uh-oh!")
                                .font(.title)
                            Text("Parece que você ainda não adicionou nenhum produto, que tal criar o primeiro?")
                                .multilineTextAlignment(.center)

                        }
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.picoleDeGroselha)
                        Spacer()
                    }
                    .frame(maxHeight: 600)
                    
                } else {
                
                ScrollView (showsIndicators: false) {
                    ForEach (viewModel.listProducts()) { product in
                        ProductCardAddView(product: product)
                    }
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
