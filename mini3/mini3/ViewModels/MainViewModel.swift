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
        loadVersionPro()
    }
    
    let orderLimitFree = 2
    
    @Published var onboardingDone : Bool = false { didSet { saveOnboarding() } }
    @Published var versionPro : Bool = false { didSet { saveVersionPro() } }
    
    // Saving Data
    let sharedUserDefaults = UserDefaults.standard
    let userKey = "user"
    let versionProKey = "versionPro"

    private func loadOnboarding() {
        onboardingDone = sharedUserDefaults.bool(forKey: userKey)
    }

    private func saveOnboarding() {
        sharedUserDefaults.set(onboardingDone, forKey: userKey)
    }
    
    func clearOnboarding() {
        sharedUserDefaults.removeObject(forKey: userKey)
    }
    
    private func loadVersionPro() {
        onboardingDone = sharedUserDefaults.bool(forKey: versionProKey)
    }

    private func saveVersionPro() {
        sharedUserDefaults.set(onboardingDone, forKey: versionProKey)
    }
    
    func clearVersionPro() {
        sharedUserDefaults.removeObject(forKey: versionProKey)
    }
}
