//
//  ContentView.swift
//  mini3
//
//  Created by Lucas Cavalherie on 27/10/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel = MainViewModel.shared
    
    @State private var showFirstScreen = true
    
    var body: some View {
        if showFirstScreen {
            SplashView().onAppear { changeScreen() }
        } else {
            if viewModel.onboardingDone {
                TabsView()
            } else {
                OnboardingView()
            }
        }
    }
    
    func changeScreen() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                showFirstScreen = false
            }
        }
    }
}

#Preview {
    MainView()
}
