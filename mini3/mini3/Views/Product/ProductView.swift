//
//  ProductView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct ProductView: View {
    @Environment(\.dismiss) private var dismiss
    
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel.shared
    @State private var showAlert = false
    @State var shouldPresentSheet = false
    var product : ProductModel
    
    var body: some View {
        VStack {
            
            
            ZStack {
                VStack {
                    Spacer()
                    
                    Image("Cremosinho_Embaixo")
                        .resizable()
                        .scaledToFit()
                }
                
                
                VStack {
                    
                    Spacer()
                    
                    VStack {
                        Image(product.imageName)
                            .resizable()
                            .frame(width: 200, height: 200)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack (alignment: .leading) {
                                Text(product.name)
                                    .font(.largeTitle)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.principal)
                                
                                Text(product.observation ?? "")
                                    .font(.subheadline)
                                    .foregroundStyle(.principal)
                            }
                            .padding()
                            
                            Spacer()
                        }
                        .padding()
                        
                        
                        VStack {
                            HStack {
                                Text("Já foram vendidos")
                                    .foregroundStyle(.principal)
                                
                                Spacer()
                                
                                Text("\(viewModel.getTotalSales(id: product.id))")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.geleiaDeMorango)
                                
                                Text("un")
                                    .foregroundStyle(.geleiaDeMorango)
                            }
                            .padding(.top)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.geleiaDeMorango),
                                alignment: .bottom
                            )
                            
                            HStack {
                                Text("Valor do Produto")
                                    .foregroundStyle(.principal)
                                
                                Spacer()
                                
                                Text("R$")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.geleiaDeMorango)
                                
                                Text("\(String(format: "%.2f", product.priceBase))")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundStyle(.geleiaDeMorango)
                            }
                            .padding(.top)
                            .overlay(
                                Rectangle()
                                    .frame(height: 1)
                                    .foregroundColor(.geleiaDeMorango),
                                alignment: .bottom
                            )
                        }
                        .padding(.horizontal, 32)
                    }
                    .padding(.top)
                    
                    Spacer()
                }
            }
        }
        .background(Color.geleiaDeMorango.edgesIgnoringSafeArea(.top))
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                        .foregroundStyle(Color.brancoNeve)
                        .font(.body)
                        .fontWeight(.semibold)
                }
            }
            
            ToolbarItem(placement: .primaryAction) {
                
                HStack {
                    
                    
                    Button() {
                        shouldPresentSheet.toggle()
                    } label: {
                        Image(systemName: "square.and.pencil")
                            .foregroundStyle(Color.brancoNeve)
                            .font(.body)
                            .fontWeight(.semibold)
                            .padding(.trailing)
                    }
                    .sheet(isPresented: $shouldPresentSheet) {
                        print("Sheet dismissed!")
                    } content: {
                        ProductCreateEditView(product: product)
                    }
                    
                    Button {
                        showAlert = true
                    } label: {
                        Image(systemName: "trash.fill")
                            .foregroundStyle(Color.brancoNeve)
                            .font(.body)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    .alert(isPresented: $showAlert) {
                        Alert(
                            title: Text("Confirmação"),
                            message: Text("Tem certeza de que deseja deletar?"),
                            primaryButton: .destructive(Text("Deletar")) {
                                viewModel.removeProduct(id: product.id)
                                dismiss()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    
                }
                .padding(.trailing, 8)
                
            }
        }
    }
}

#Preview {
    ProductView(product: ProductModel(name: "Bolo", imageName: "IconeBrigadeiro", observation: "Observacao", priceBase: 10, createdAt: Date.now))
}
