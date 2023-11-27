//
//  ProductListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import SwiftUI

enum ProductSort {
    case nameAsc
    case nameDesc
    case createdDateAsc
    case createdDateDesc
}

struct ProductListView: View {
    @State var shouldPresentSheet = false
    
    @State var sort : ProductSort = .nameAsc
    
    @ObservedObject var viewModel: ProductViewModel = ProductViewModel.shared
    @State var products : [ProductModel] = []
    
    func applySort() {
        switch sort {
            case .nameAsc:
                products.sort{$0.name < $1.name}
            case .nameDesc:
                products.sort{$0.name > $1.name}
            case .createdDateAsc:
                products.sort{$0.createdAt < $1.createdAt}
            case .createdDateDesc:
                products.sort{$0.createdAt > $1.createdAt}
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Cremosinho_Tab")
                        .resizable()
                        .scaledToFit()
                    
                    HStack(alignment: .top) {
                        Image("produtos")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 50)
                        Spacer()
                        
                        Button() {
                            shouldPresentSheet.toggle()
                        } label: {
                            AddButtonView()
                        }
                        .sheet(isPresented: $shouldPresentSheet) {
                            print("Sheet dismissed!")
                            products = viewModel.listProducts()
                            applySort()
                        } content: {
                            ProductCreateEditView()
                        }
                        
                    }
                    .padding(.horizontal, 32)
                }
                
                Spacer()
                
                if products.count == 0 {
                    VStack {
                        Spacer()
                        Image("Pavinho_Triste")
                            .padding(16)
                        VStack {
                            Text("Uh-oh!")
                                .font(.title)
                            Text("Parece que você ainda não tem nenhum produto, que tal adicionar o primeiro?")
                                .padding(.horizontal, 32)
                                .multilineTextAlignment(.center)
                         
                        }
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundStyle(.picoleDeGroselha)
                        Spacer()
                    }
                    .frame(maxHeight: 600)
                } else {
                    VStack(spacing: 8){
                        
                        HStack {
                            Text("Todos os produtos")
                                .foregroundStyle(Color("principal"))
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Menu {
                                Button {
                                    sort = .nameAsc
                                } label: {
                                    Text("Nome (Crescente)")
                                }
                                Button {
                                    sort = .nameDesc
                                } label: {
                                    Text("Nome (Decrescente)")
                                }
                                Button {
                                    sort = .createdDateAsc
                                } label: {
                                    Text("Data de criação (Crescente)")
                                }
                                Button {
                                    sort = .createdDateDesc
                                } label: {
                                    Text("Data de criação (Decrescente)")
                                }
                            } label: {
                                Image(systemName: "arrow.up.arrow.down.square.fill")
                                    .font(.title3)
                                    .foregroundStyle(.verdeMatcha)
                            }
                        }
                        
                        ScrollView (showsIndicators: false){
                            VStack {
                                ForEach (products) { product in
                                    NavigationLink {
                                        ProductView(product: product)
                                    } label: {
                                        ProductListCardView(product: product)
                                    }
                                }
                                
                            }
                        }
                    }
                    .padding(.horizontal, 32)
                    .padding(.top, 32)
                }
                
            }
            .background(Color.algodaoDoce.edgesIgnoringSafeArea(.bottom))
            .onAppear {
                products = viewModel.listProducts()
                applySort()
            }
            .onChange(of: sort) { _, _ in
                applySort()
            }
        }
    }
}

#Preview {
    ProductListView()
}
