//
//  SplashView.swift
//  Pave
//
//  Created by Lucas Cavalherie on 15/11/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        VStack {
            Image("LogoSplash")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.geleiaDeMorango)
    }
}

#Preview {
    SplashView()
}
