//
//  ContentView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 01/04/2024.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        
        TabView {
            
            // HOME
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            // ARTICLES
            ArticlesView()
                .tabItem {
                    Label("Articles", systemImage: "newspaper.fill")
                }
            
            // CAMERA
            CameraView(classifier: ImageClassifier())
                .tabItem {
                    Label("", systemImage: "camera.fill")
                }
            
            // ABOUT
            AboutView()
                .tabItem {
                    Label("About", systemImage: "info.circle")
                }
            
            // SETTINGS
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
            
        }
        .accentColor(.green)
        
    }
}

#Preview {
    ContentView()
}
