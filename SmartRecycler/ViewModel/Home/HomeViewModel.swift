//
//  HomeViewModel.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var filteredMaterial: Material?
    
    @Published var materials: [Material] = [
        Material(
            name: "Plastic",
            imageName: "Plastic",
            foundIn: [
                 "Food packaging, including bottles and containers",
                 "Household items such as detergent bottles, shampoo bottles, and plastic bags",
                 "Children’s toys and garden furniture"
            ],
            disposal: [
                "Remove and discard non-recyclable parts like caps and labels unless your local facility states they can be recycled together."
            ],
            tips: [
                "Ensure all plastic containers are clean and dry before recycling. Leftover residues can contaminate the recycling process.",
                "Consider repurposing plastic containers into planters, bird feeders, or storage solutions for small items around the house."
            ]
        ),
        
        Material(
            name: "Paper",
            imageName: "Paper", 
            foundIn: [
                "Newspapers, magazines, and books",
                "Office paper, envelopes, and cardboard boxes",
                "Paper bags and wrapping paper"
            ],
            disposal: [
                "Flatten cardboard boxes to save space in recycling bins.",
                "Use paper bags as compostable waste bags for kitchen scraps or as bin liners for dry trash."
            ],
            tips: [
                "Ensure paper products are dry and not contaminated with food, oil, or other materials.",
                "Use paper scraps for homemade notepads or as packing material for gifts or storage."
            ]
        ),
        
        Material(
            name: "Metal", 
            imageName: "Metal",
            foundIn: [
                "Food cans, soda cans, aluminum foil, and baking trays",
                "Home appliances and metal fittings",
                "Tools, nails, and screws"
            ],
            disposal: [
                "Collect metals separately from other recyclables. Larger metal items should be taken to a scrap metal dealer or a facility equipped to handle them."
            ],
            tips: [
                "Remove any food residue from cans and foil. For larger metal items, ensure they're free of non-metal parts.",
                "Metal cans can be reused as pen holders, lanterns, or even small baking molds with appropriate cleaning and modification."
            ]
        ),
        
        Material(
            name: "Glass",
            imageName: "Glass", 
            foundIn: [
                "Beverage bottles, jars (e.g., jam, sauces)",
                "Windows, mirrors, and some types of light bulbs",
                "Glassware and vases"
            ],
            disposal: [
                "Wrap broken glass in newspaper or place it inside a cardboard box to prevent injury and mark it as broken glass before disposal."
            ],
            tips: [
                "Glass jars and bottles can be cleaned and repurposed as containers for homemade preserves, candle holders, or decorative flower vases.",
                "Remove all lids and labels where possible. Clean thoroughly to remove any residues."
            ]
        ),
    ]
    
    
    //
    func filterMaterials(category: String) {
        filteredMaterial = materials.first { $0.name.lowercased() == category.lowercased() }
    }
    
}
