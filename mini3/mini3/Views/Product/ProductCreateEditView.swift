//
//  ProductCreateEditView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductCreateEditView: View {
    
    var product : ProductModel? = nil
    
    @State var name = ""
    @State var value : Float = 0
    @State var observation = ""
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel.shared
    
    var body: some View {
        VStack (spacing: 0) {
            HStack {
                Text("Adicionar produto")
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
            
            Form {
                Section {
                    TextField("Nome do produto...", text: $name)
                    TextField("Valor base do produto...", value: $value, format: .number)
                        .keyboardType(.decimalPad)
                }
                
//                Section {
//                    TextField("Ícone", text: $observation, axis: .vertical)
//                        .padding(.bottom, 120)
//                }
                
                Section {
                    TextField("Observação", text: $observation, axis: .vertical)
                        .padding(.bottom, 180)
                }
                
            }
            
            .scrollContentBackground(.hidden)
            .background(.algodaoDoce)
            .formStyle(.grouped)
            
            Button {
                if let product = product {
                    viewModel.editProduct(id: product.id, name: name, observation: observation, priceBase: value)
                } else {
                    viewModel.addProduct(name: name, observation: observation, priceBase: value, createdAt: Date.now)
                }
                
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
            .padding(.horizontal)
        }
        .padding(.horizontal)
        .background(.algodaoDoce)
        .onAppear{
            if let product = product {
                name = product.name
                observation = product.observation ?? ""
                value = product.priceBase
            }
        }
    }
}

#Preview {
    ProductCreateEditView()
}
