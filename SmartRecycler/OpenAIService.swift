//
//  OpenAIService.swift
//  SeeFood
//
//  Created by Chris Min on 23/03/2024.
//

import Foundation
import Alamofire


class OpenAIService {
    
    private let urlString = "https://api.openai.com/v1/chat/completions"
    
    func sendMessage(messages: [Message]) async -> OpenAIChatResponse? {
        let openAIMessages = messages.map { OpenAIChatMessage(role: $0.role, content: $0.content) }
        let body = OpenAIChatBody(model: "gpt-3.5-turbo", messages: openAIMessages)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(Constants.openAIApiKey)"
        ]
        do {
            print(try await AF.request(urlString, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIChatResponse.self).value)
        } catch {
            print(error.localizedDescription)
        }
        return try? await AF.request(urlString, method: .post, parameters: body, encoder: .json, headers: headers).serializingDecodable(OpenAIChatResponse.self).value
    }
    
}


struct OpenAIChatBody: Codable {
    let model: String
    let messages: [OpenAIChatMessage]
}


struct OpenAIChatMessage: Codable {
    let role: SenderRole
    let content: String
}

enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}


struct OpenAIChatResponse: Codable {
    let choices: [OpenAIChoice]
}

struct OpenAIChoice: Codable {
    let message: OpenAIChatMessage
}
