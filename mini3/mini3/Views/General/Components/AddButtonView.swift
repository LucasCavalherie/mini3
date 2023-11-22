//
//  AddButtonView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Image(systemName: "plus")
            .foregroundColor(.white)
            .font(.callout)
            .fontWeight(.bold)
            .padding(8)
            .background(.amareloGema)
            .cornerRadius(8)
    }
}

#Preview {
    AddButtonView()
}
