//
//  NewsView.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 01/04/2024.
//

import SwiftUI


struct ArticlesView: View {
    
    @ObservedObject var viewModel = ArticlesViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            List(viewModel.articles) { article in
                
                NavigationLink(value: article) {
                    
                    HStack {
                        
                        // ARTICLE IMAGE
                        if let imageUrl = article.imageUrl,
                            let url = URL(string: imageUrl) {
                            
                            AsyncImage(url: url) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 60)
                            .cornerRadius(8)
                            
                        }
                        
                        // ARTICLE TEXT
                        VStack(alignment: .leading, spacing: 5) {
                            Text(article.webTitle)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            HStack {
                                Text("\(article.formattedDate)")
                                
                                Text("\(article.formattedTime)")
                            }
                            .font(.footnote)
                        }
                        
                        
                    }
                    .padding(.vertical, 8)
                    
                }
                
            }
            .navigationTitle("Articles")
            .navigationDestination(for: Article.self) { article in
                ArticlesDetailView(article: article)
            }
            .onAppear {
                viewModel.fetchArticles()
            }
            
        }
        
    }
    
}


#Preview {
    ArticlesView()
}
