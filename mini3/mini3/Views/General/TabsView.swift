//
//  TabView.swift
//  Pave
//
//  Created by Lucas Cavalherie on 15/11/23.
//

import SwiftUI

struct TabsView: View {
    var body: some View {
        TabView {
            Group {
                OrderListView()
                    .tabItem {
                        Label("Agenda", systemImage: "calendar")
                    }
                
                ProductListView()
                    .tabItem {
                        Label("Produtos", systemImage: "birthday.cake")
                    }
                
                OrderListDoneView()
                    .tabItem {
                        Label("Pedidos", systemImage: "list.clipboard.fill")
                    }
                
                DebugView()
                    .tabItem {
                        Label("Debug", systemImage: "xmark.circle.fill")
                    }
            }
        }
        .tint(.picoleDeGroselha)
        .onAppear {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        }
    }
}

#Preview {
    TabsView()
}
