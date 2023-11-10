//
//  OrderCreateEditView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct OrderCreateEditView: View {
    
    @State var name = ""
    @State var customerName = ""
    @State var customerContact = ""
    @State var date : Date = Date()
    
    @State var shouldPresentSheet = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
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
                TextField("Nome do produto...", text: $name)
                TextField("Valor base do produto...", text: $customerName)
                TextField("Valor base do produto...", text: $customerContact)
            }
            .frame(height: 175)
            .padding(.horizontal)
            .scrollContentBackground(.hidden)
            .background(.algodaoDoce)
            .formStyle(.grouped)
            
            VStack (alignment: .leading) {
                
                DatePicker("Entrega", selection: $date)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.principal)
                
                HStack {
                    Text("Itens do pedido")
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
                        OrderAddItemView()
                    }
                }
                .padding(.top)
                
                ScrollView (showsIndicators: false) {
                    ForEach (1..<11) { index in
                        OrderItemCardAddView()
                    }
                }
                
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
            .padding(32)
            
            
        }
        .background(.algodaoDoce)
    }
}

#Preview {
    OrderCreateEditView()
}
