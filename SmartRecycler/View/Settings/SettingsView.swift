//
//  SettingsView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI


struct SettingsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var viewModel = SettingsViewModel()
    
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                
                // APPEARANCE SECTION
                Section(header: Text("Appearance")) {
                    Toggle(isOn: $viewModel.isDarkMode) {
                        Text("Dark Mode")
                    }
                }
                
                // GENERAL SECTION
                Section(header: Text("General")) {
                    Toggle("Enable Notifications", isOn: $viewModel.isNotificationsEnabled)
                }
                
                // PRIVACY SECTION
                Section(header: Text("Privacy")) {
                    Toggle("Location Tracking", isOn: $viewModel.isLocationTrackingEnabled)
                }
                
                // ABOUT SECTION
                Section(header: Text("About")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("1.0.0")
                    }
                }
                
            }
            .navigationTitle("Settings")
            
        }
        .onAppear {
            viewModel.isDarkMode = (colorScheme == .dark)
        }
        
    }
    
}


#Preview {
    SettingsView()
}

