//
//  HomeView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 28/04/2024.
//

import SwiftUI


struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(viewModel.materials) { material in
                        NavigationLink(value: material) {
                            HomeItemRow(material: material)
                        }
                    }
                }
                .padding(.vertical)
                
            }
            .navigationTitle("Materials")
            .navigationDestination(for: Material.self) { material in
                HomeDetailView(material: material)
            }
            
        }
    }
}


#Preview {
    HomeView()
}
