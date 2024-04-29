//
//  HelpSheetView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI


struct HelpSheetView: View {
    @Binding var show: Bool
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                
                Text("Waste Scanner uses AI image labelling and object recognition to process the photo and provide the videos for recycling.")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 6) {
                    Text("Tutorial")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("For the best result, try keeping only one object in the photo, and make it clearly visible.")
                        .font(.headline)
                }
                
                // FOLLOW BUTTON
                Button {
                    show = false
                } label: {
                    Text("Got it!")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .foregroundStyle(.white)
                        .background(.green)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    
                }
                
            }
            .padding(.horizontal)
            .navigationTitle("How does it work?")
        }
    }
}

#Preview {
    HelpSheetView(show: .constant(true))
}
