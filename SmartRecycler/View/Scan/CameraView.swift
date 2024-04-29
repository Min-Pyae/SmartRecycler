//
//  CameraView.swift
//  SeeFood
//
//  Created by Chris Min on 26/02/2024.
//

import SwiftUI


struct CameraView: View {
    
    @State var showImagePicker = false
    @State var uiImage: UIImage?
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @ObservedObject var classifier: ImageClassifier
    
    @ObservedObject var viewModel = CameraViewModel()
    @ObservedObject var homeViewModel = HomeViewModel()
    
    @State private var showHelpSheet = false
    
    @State private var videos = [Video]()
    
    
    var body: some View {
        
        NavigationStack {
            
            VStack {
                
                ZStack {
                    
                    Rectangle()
                        .strokeBorder()
                        .foregroundColor(.green)
                        .overlay(
                            Group {
                                if let uiImage = uiImage {
                                    Image(uiImage: uiImage)
                                        .resizable()
                                        .scaledToFit()
                                        .padding()
                                } else {
                                    Text("Try Keeping Only One Object")
                                        .font(.headline)
                                        .foregroundStyle(.primary)
                                }
                            }
                        )
                    
                    
                    if let identifiedObject = classifier.object {
                        
                        VStack {
                            
                            HStack {
                                
                                if let category = classifier.category {
                                    
                                    Text("\(identifiedObject) (\(category))")
                                        .font(.headline)
                                        .onTapGesture {
                                            onTapLabel(object: identifiedObject)
                                        }
                                } else {
                                    Text("\(identifiedObject)")
                                        .font(.headline)
                                        .onTapGesture {
                                            onTapLabel(object: identifiedObject)
                                        }
                                }
                                
                                Image(systemName: "info.circle")
                                
                            }
                            .sheet(isPresented: $viewModel.showDetailSheet) {
                                ScanDetailSheetView(videos: $viewModel.videos, category: homeViewModel.filteredMaterial)
                            }
                            .font(.subheadline)
                            .padding()
                            .background(Color.green.opacity(0.8))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            
                        }
                        
                    }
                    
                }
                
                
                VStack {
                    
                    HStack(spacing: 50) {
                        
                        // GALLERY ACCESS
                        Circle()
                            .frame(width: 50, height: 50)
                            .overlay {
                                Image(systemName: "photo")
                                    .onTapGesture {
                                        showImagePicker = true
                                        sourceType = .photoLibrary
                                    }
                                    .foregroundStyle(.white)
                            }
                        
                        
                        // CAMERA ACCESS
                        Circle()
                            .frame(width: 50, height: 50)
                            .overlay {
                                Image(systemName: "camera")
                                    .onTapGesture {
                                        showImagePicker = true
                                        sourceType = .camera
                                    }
                                    .foregroundStyle(.white)
                            }
                        
                    }
                    .font(.title)
                    .foregroundColor(.green)
                    
                }
                .padding()
                
            }
            .navigationTitle("Scan Waste")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(uiImage: $uiImage, isPresenting: $showImagePicker, sourceType: $sourceType)
                    .onDisappear {
                        if let uiImage = uiImage {
                            classifier.detect(uiImage: uiImage)
                        }
                    }
            }
            .navigationBarItems(
                trailing:
                    Button(action: {
                        showHelpSheet = true
                    }) {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.title2)
                            .foregroundStyle(.green)
                    }
            )
            .sheet(isPresented: $showHelpSheet) {
                HelpSheetView(show: $showHelpSheet)
                    .presentationDetents([.height(350)])
            }
            .padding()
            
        }
        
    }
    
    
    // FUNCTION FOR TAPPING LABEL
    private func onTapLabel(object: String) {
        viewModel.fetchVideos(searchQuery: object)
        
        if classifier.category == "cardboard" {
            homeViewModel.filterMaterials(category: "paper")
        } else {
            homeViewModel.filterMaterials(category: classifier.category ?? "")
        }
        
    }
    
}


#Preview {
    CameraView(classifier: ImageClassifier())
}
