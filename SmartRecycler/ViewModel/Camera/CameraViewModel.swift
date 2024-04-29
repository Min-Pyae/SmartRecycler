//
//  CameraViewModel.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import Foundation


class CameraViewModel: ObservableObject {
    
    @Published var videos = [Video]()
    @Published var showDetailSheet = false
    
    func fetchVideos(searchQuery: String) {
        let apiKey = "AIzaSyA9DGU3YW1PLF2u-2_cIoaZ4zfI15fridc"
        let baseUrl = "https://www.googleapis.com/youtube/v3/search"
        let queryItems = [
            URLQueryItem(name: "part", value: "snippet"),
            URLQueryItem(name: "type", value: "video"),
            URLQueryItem(name: "q", value: "5 minute crafts DIY recycling \(searchQuery)"),
            URLQueryItem(name: "key", value: apiKey),
            URLQueryItem(name: "maxResults", value: "5")
        ]
        var urlComps = URLComponents(string: baseUrl)!
        urlComps.queryItems = queryItems
        
        guard let url = urlComps.url else { return }
        
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            if let response = try? JSONDecoder().decode(YouTubeResponse.self, from: data) {
                DispatchQueue.main.async {
                    // Map each item to a Video, including the thumbnail URL
                    self.videos = response.items.map {
                        Video(
                            id: $0.id.videoId,
                            title: $0.snippet.title,
                            thumbnailURL: $0.snippet.thumbnails.high.url
                        )
                    }
                    self.showDetailSheet = true
                }
            }
        }.resume()
    }
}
