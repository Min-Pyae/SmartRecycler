//
//  Article.swift
//  RecycleSmartGuide
//
//  Created by Chris Min on 01/04/2024.
//

import Foundation

struct Article: Identifiable, Decodable, Hashable {
    
    let id: UUID = UUID()
    let webTitle: String
    let webUrl: String
    let webPublicationDate: String
    var imageUrl: String?
    
    // COMPUTED PROPERTIES FOR FORMATTED DATE AND TIME
    var formattedDate: String {
        formatDate(dateString: webPublicationDate, withFormat: "yyyy-MM-dd")
    }
    
    var formattedTime: String {
        formatDate(dateString: webPublicationDate, withFormat: "HH:mm")
    }
    
    
    private func formatDate(dateString: String, withFormat format: String) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        if let date = dateFormatter.date(from: dateString) {
            
            dateFormatter.dateFormat = format
            
            return dateFormatter.string(from: date)
            
        } else {
            
            return "N/A"
            
        }
        
    }
    
    
    enum CodingKeys: String, CodingKey {
        case webTitle, webUrl, webPublicationDate, fields
    }
    
    
    enum FieldsKeys: String, CodingKey {
        case thumbnail
    }
    
    
    // INIT TO PARSE NESTED JSON FOR IMAGE URL
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        webTitle = try container.decode(String.self, forKey: .webTitle)
        webUrl = try container.decode(String.self, forKey: .webUrl)
        webPublicationDate = try container.decode(String.self, forKey: .webPublicationDate)
        
        let fieldsContainer = try? container.nestedContainer(keyedBy: FieldsKeys.self, forKey: .fields)
        imageUrl = try fieldsContainer?.decodeIfPresent(String.self, forKey: .thumbnail)
        
    }
    
}


struct Response: Decodable {
    let response: Articles
}


struct Articles: Decodable {
    let results: [Article]
}
