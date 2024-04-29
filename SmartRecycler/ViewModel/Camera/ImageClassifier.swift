//
//  ImageClassification.swift
//  SeeFood
//
//  Created by Leon Wei on 5/31/21.
//

import SwiftUI

class ImageClassifier: ObservableObject {
    
    @Published private var classifier = Classifier()
    
    var object: String? {
        classifier.object
    }
    
    var category: String? {
        classifier.category
    }
        
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifier.detectObject(ciImage: ciImage)
        classifier.detectCategory(ciImage: ciImage)
    }
        
}
