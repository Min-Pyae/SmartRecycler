//
//  DetailScreen.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 01/04/2024.
//

import SwiftUI
import WebKit


struct ArticlesDetailView: View {
    
    let article: Article

    var body: some View {
        
        WebView(url: URL(string: article.webUrl)!)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(.hidden, for: .tabBar)
        
    }
    
}

struct WebView: UIViewRepresentable {
    
    var url: URL

    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}


