//
//  YouTubeResponse.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 29/04/2024.
//

import Foundation

struct YouTubeResponse: Codable {
    let items: [Item]
    struct Item: Codable {
        let id: ID
        let snippet: Snippet
        struct ID: Codable {
            let videoId: String
        }
        struct Snippet: Codable {
            let title: String
            let thumbnails: Thumbnails
            struct Thumbnails: Codable {
                let high: High
                struct High: Codable {
                    let url: String
                }
            }
        }
    }
}
