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
            VStack(alignment: .leading, spacing: 40) {
                
                Text("This scanner uses image classification technology to provide information and videos for recycling and disposal of scanned item.")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("Tip")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text("Try to keep only one object of the image and make it clear for the best result.")
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
