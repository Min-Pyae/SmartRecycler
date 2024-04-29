//
//  DetailView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI

struct ScanDetailMaterialView: View {
    
    var material: Material?
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .center) {
                
                // MATERIAL IMAGE
                Image(material?.imageName ?? "")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.gray)
                    .clipShape(
                        RoundedRectangle(cornerRadius: 5)
                    )
                    .padding(.vertical, -20)
            
                VStack(alignment: .leading, spacing: 20) {
                    
                    // COMMON SOURCES
                    VStack(alignment: .leading, spacing: 10) {
                        
                        // HEADING
                        Text("Category: \(material?.name ?? "")")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                
                    }
                    
                    
                    // DISPOSAL
                    VStack(alignment: .leading, spacing: 10) {
                        
                        // HEADING
                        Text("Disposal")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        // INFO
                        ForEach(material?.disposal ?? [], id: \.self) { disposal in
                            HStack {
                                Text(disposal)
                                    .font(.callout)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        
                    }
                    
                    
                    
                    // RECYCLING TIPS
                    VStack(alignment: .leading, spacing: 10) {
                        
                        // HEADING
                        Text("Recycling Tips")
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        // INFO
                        ForEach(material?.tips ?? [], id: \.self) { tips in
                            HStack {
                                Text(tips)
                                    .font(.callout)
                                    .multilineTextAlignment(.leading)
                            }
                        }
                        
                    }
                    
                }
                
                
            }

        }
    }
}

#Preview {
    ScanDetailMaterialView(material: Material(
        name: "Plastic",
        imageName: "Plastic",
        foundIn: [
             "Food packaging, including bottles and containers.",
             "Household items such as detergent bottles, shampoo bottles, and plastic bags.",
             "Children’s toys and garden furniture."
        ],
        disposal: [
            "Remove and discard non-recyclable parts like caps and labels unless your local facility states they can be recycled together."
        ],
        tips: [
            "Ensure all plastic containers are clean and dry before recycling. Leftover residues can contaminate the recycling process.",
            "Consider repurposing plastic containers into planters, bird feeders, or storage solutions for small items around the house."
        ]
    ))
}
