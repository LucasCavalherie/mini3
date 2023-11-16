//
//  MainViewModel.swift
//  Pave
//
//  Created by Lucas Cavalherie on 15/11/23.
//

import Foundation

class MainViewModel: ObservableObject {
    static let shared = MainViewModel()
    
    private init() {
        loadOnboarding()
    }
    
    @Published var onboardingDone : Bool = false { didSet { saveOnboarding() } }
    
    // Saving Data
    let sharedUserDefaults = UserDefaults.standard
    let userKey = "user"

    private func loadOnboarding() {
        onboardingDone = sharedUserDefaults.bool(forKey: userKey)
    }

    private func saveOnboarding() {
        sharedUserDefaults.set(onboardingDone, forKey: userKey)
    }
    
    func clearOnboarding() {
        sharedUserDefaults.removeObject(forKey: userKey)
    }
}
