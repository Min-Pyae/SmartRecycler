//
//  AboutView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI


struct AboutView: View {
    
    var body: some View {
        
        NavigationStack {
            ScrollView() {
                VStack(alignment: .leading, spacing: 40) {
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text("'Recycle Smart Guide' is a revolutionary application that aims to enhance recycling efforts and waste management through technology.")
                            .font(.callout)
                        
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Features:")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        FeatureText(text: "Scan household items to learn about recyclable materials and disposal methods")
                        FeatureText(text: "Watch DIY tutorials on recycling those scanned materials")
                        FeatureText(text: "Contribute to the community by sharing your knowledge and tips")
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Our Mission")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        Text("Our mission is to empower individuals ducates users about recycling practices, helping to reduce overall waste and improve sustainability.")
                            .font(.callout)
                        
                        Text("With this application, users can quickly scan any household waste item to recycle or dispose of it in the most environmentally friendly way.")
                            .font(.callout)
                    }
                    
                    Spacer()
                    
                }
                .padding()
                
            }
            .navigationTitle("About Us")
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            
        }
        
    }
    
}


#Preview {
    AboutView()
}
