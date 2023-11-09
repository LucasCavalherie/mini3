//
//  OrderItemsListView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square.fill" : "square")
                    .foregroundStyle(Color.geleiaDeMorango)
                configuration.label
            }
        })
    }
}

struct OrderItemCardListView: View {
    @State private var isOn = false
    
    var body: some View {
        HStack {
            VStack {
                Text("50")
                    .fontWeight(.bold)
                Text("un.")
                    .font(.caption2)
            }
            .foregroundStyle(.background)
            .padding()
            .background(Color.geleiaDeMorango)
            
            Text("Truco truco truco!!!")
            
            Spacer()
            
            Toggle(isOn: $isOn){}
                .toggleStyle(iOSCheckboxToggleStyle())
        }
        .padding(.trailing)
        .background(Color.brancoNeve)
        .cornerRadius(8)
        .padding(.horizontal)
    }
}

#Preview {
    OrderItemCardListView()
}
