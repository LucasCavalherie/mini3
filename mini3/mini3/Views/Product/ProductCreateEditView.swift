//
//  ProductCreateEditView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductCreateEditView: View {
    
    @State var name = ""
    @State var valor = ""
    @State var observation = ""
    @Environment(\.dismiss) private var dismiss
    
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
                    TextField("Valor base do produto...", text: $valor)
                }
                
                Section {
                    TextField("Ícone", text: $observation, axis: .vertical)
                        .padding(.bottom, 120)
                }
                
                Section {
                    TextField("Observação", text: $observation, axis: .vertical)
                        .padding(.bottom, 180)
                }
                
                Section {
                    Button {
                        print("flamengo")
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
                .listRowBackground(Color.clear)
            }
            .padding(.horizontal)
            .scrollContentBackground(.hidden)
            .background(.algodaoDoce)
            .formStyle(.grouped)
        }
        .background(.algodaoDoce)
    }
}

#Preview {
    ProductCreateEditView()
}
