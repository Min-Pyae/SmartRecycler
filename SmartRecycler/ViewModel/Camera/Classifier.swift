//
//  Classifier.swift
//  SeeFood
//
//  Created by Leon Wei on 5/31/21.
//

import CoreML
import Vision
import CoreImage

struct Classifier {
    
    var object: String?
    var category: String?
    
    mutating func detectObject(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: MobileNetV2(configuration: MLModelConfiguration()).model) else { return }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            // Split the identifier string and get the last word
            let identifierWords = firstResult.identifier.split(separator: " ").map(String.init)
            self.object = identifierWords.last
        }
        
    }
    
    mutating func detectCategory(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: RecycledObjects(configuration: MLModelConfiguration()).model) else { return }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let category = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = category.first {
            self.category = firstResult.identifier
        }
        
    }
    
}

