//
//  ContentView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                OrderListView()
                    .tabItem {
                        Label("Menu", systemImage: "calendar")
                    }

                ProductView()
                    .tabItem {
                        Label("Order", systemImage: "birthday.cake")
                    }
                
                OrderListDoneView()
                    .tabItem {
                        Label("Order", systemImage: "list.clipboard.fill")
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
