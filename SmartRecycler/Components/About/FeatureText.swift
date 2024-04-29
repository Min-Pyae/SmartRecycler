//
//  FeatureText.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI

struct FeatureText: View {
    
    let text: String
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.leading)
                
        }
        .padding(.leading)
        
    }
}

#Preview {
    FeatureText(text: "")
}
