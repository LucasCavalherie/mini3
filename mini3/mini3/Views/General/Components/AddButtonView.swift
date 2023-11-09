//
//  AddButtonView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct AddButtonView: View {
    var body: some View {
        Image(systemName: "plus.app.fill")
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(Color("amareloGema"))
    }
}

#Preview {
    AddButtonView()
}
