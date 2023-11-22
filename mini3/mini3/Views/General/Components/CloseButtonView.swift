//
//  CloseButtonView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 07/11/23.
//

import SwiftUI

struct CloseButtonView: View {
    var body: some View {
        Image(systemName: "xmark")
            .foregroundColor(.white)
            .font(.callout)
            .fontWeight(.bold)
            .padding(8)
            .background(.picoleDeGroselha)
            .cornerRadius(8)
    }
}

#Preview {
    CloseButtonView()
}
