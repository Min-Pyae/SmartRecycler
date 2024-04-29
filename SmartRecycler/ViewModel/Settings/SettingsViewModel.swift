//
//  SettingsViewModel.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI


class SettingsViewModel: ObservableObject {
    
    @Published var isNotificationsEnabled: Bool = false
    @Published var isLocationTrackingEnabled: Bool = false
    @Published var isDarkMode: Bool = UserDefaults.standard.bool(forKey: "isDarkMode") {
        didSet {
            UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
            updateAppearance()
        }
    }
    
    
    // FUNCTION FOR UPDATING LIGHT AND DARK MODE APPEARANCE
    func updateAppearance() {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene else { return }
        
        windowScene.windows.forEach { window in
            window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
        }
        
    }
    
}
