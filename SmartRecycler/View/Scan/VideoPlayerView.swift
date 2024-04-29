//
//  ScanDetailView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import SwiftUI
import WebKit


struct VideoPlayerView: View, Hashable {
    let videoID: String
    
    var body: some View {
        
        VideoPlayerWebView(videoID: videoID)
            .navigationBarTitle("Video", displayMode: .inline)
            .edgesIgnoringSafeArea(.all)
        
    }
}


struct VideoPlayerWebView: UIViewRepresentable {
    
    var videoID: String
    
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else { return }
        
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }
    
}


//#Preview {
//    VideoPlayerView()
//}
