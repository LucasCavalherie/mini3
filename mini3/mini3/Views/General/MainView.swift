//
//  ContentView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            Group {
                OrderListView()
                    .tabItem {
                        Label("Agenda", systemImage: "calendar")
                    }
                
                ProductView()
                    .tabItem {
                        Label("Produtos", systemImage: "birthday.cake")
                    }
                
                OrderListDoneView()
                    .tabItem {
                        Label("Pedidos", systemImage: "list.clipboard.fill")
                    }
            }
        }
        .tint(Color("geleiaDeMorango"))
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

#Preview {
    MainView()
}
