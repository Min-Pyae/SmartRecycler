//
//  NewsViewModel.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 01/04/2024.
//

import Foundation


class ArticlesViewModel: ObservableObject {
    
    @Published var articles = [Article]()
    
    
    // FUNCTION FOR FETCHING ARTICLES
    func fetchArticles() {
        
        let urlString = "https://content.guardianapis.com/search?tag=environment/recycling&show-fields=thumbnail&page-size=100&api-key=23ab1f61-1fe0-43c6-a0e3-53d1b8a87bc0"
        
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let data = data {
                
                if let response = try? JSONDecoder().decode(Response.self, from: data) {
                    
                    DispatchQueue.main.async {
                        self.articles = response.response.results
                    }
                    
                }
            }
            
        }.resume()
        
    }
}


