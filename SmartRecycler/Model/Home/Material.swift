//
//  Materials.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import Foundation


// A DATA MODEL FOR THE MATERIAL LIST ITEM
struct Material: Identifiable, Hashable {
    
    let id: UUID = UUID()
    let name: String
    let imageName: String
    var foundIn: [String]
    var disposal: [String]
    var tips: [String]
    
}
