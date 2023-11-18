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
    @State var value: Float? = nil
    @State var observation = ""
    @Environment(\.dismiss) private var dismiss
    
    @State private var selectedIcon: String = ""
    let icons = ["IconeBeijinho", "IconeEstrela", "IconeCupcake", "IconeCookie", "IconeBolo", "IconeBiscoito", "IconeBoloInteiro", "IconeBrigadeiro"]
    let iconColors = [Color.limaoTahiti, Color.boloDePedreiro, Color.limonada, Color.picoleDeGroselha, Color.geleiaDeMorango, Color.verdeMatcha, Color.amareloGema, Color.musseDeMorango]
    
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
            .padding(.horizontal, 20)
            
            Form {
                Section {
                    TextField("Nome do produto...", text: $name)
                    TextField("Valor base do produto...", value: $value, format: .number)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Selecione um ícone")) {
                    LazyVGrid(columns: Array(repeating: GridItem(), count: 4), spacing: 12) {
                        ForEach(Array(icons.enumerated()), id: \.element) { index, icon in
                            Image(icon)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .background(iconColors[index])
                                .cornerRadius(12)
                                .foregroundColor(selectedIcon == icon ? .blue : .black)
                                .border(selectedIcon == icon ? Color.blue : Color.clear, width: 2)
                                .onTapGesture {
                                    selectedIcon = icon
                                }
                        }
                    }
                    .padding(.vertical, 8)
                }
                
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
                    var icon = selectedIcon == "" ? product.imageName : selectedIcon
                    viewModel.editProduct(id: product.id, name: name, imageName: icon, observation: observation, priceBase: value ?? 0)
                } else {
                    viewModel.addProduct(name: name, imageName: selectedIcon, observation: observation, priceBase: value ?? 0, createdAt: Date.now)
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
