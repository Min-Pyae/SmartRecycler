//
//  HomeItemRow.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI

// A ROW VIEW FOR EACH MATERIAL IN THE LIST
struct HomeItemRow: View {
    var material: Material
    
    var body: some View {
        VStack {
            VStack {
                Image(material.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
               
                Text(material.name)
                    .font(.title2)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.primary)
                    .padding(.leading, 10)
                
                
            }
            
            Divider()
            
        }
        .padding(.horizontal)
    }
}

//#Preview {
//    HomeItemRow(material: Material(name: "Plastic", imageName: "Plastic", foundIn: "", tips: ""))
//}
