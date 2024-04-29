//
//  VideoListSheet.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI

struct ScanDetailSheetView: View {
    @Binding var videos: [Video]
    var category: Material?
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    if category != nil {
                        ScanDetailMaterialView(material: category)
                    }
                    
                    
                    Text("Tutorials for Recycling: ")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    
                    ForEach(videos) { video in
                        
                        NavigationLink(value: video.id) {
                            
                            VStack {
                                
                                HStack {
                                    
                                    // THUMBNAIL IMAGE
                                    if let url = URL(string: video.thumbnailURL) {
                                        AsyncImage(url: url) { image in
                                            image.resizable()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 100, height: 60)
                                        .cornerRadius(8)
                                    }
                                    
                                    // VIDEO TITLE TEXT
                                    Text(video.title)
                                        .font(.callout)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                        .padding(.leading, 8)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .font(.title2)
                                    
                                }
                                
                                Divider()
                                
                            }
                        }
                    }
                    
                }
                .padding()
                
            }
            .navigationDestination(for: String.self) { videoID in
                VideoPlayerView(videoID: videoID)
            }
            
        }
    }
}


//#Preview {
//    ScanDetailSheetView()
//}
