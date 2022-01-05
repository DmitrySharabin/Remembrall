//
//  SetName.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import SwiftUI

struct SetName: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var name = ""
    @State private var image: Image?
    
    let inputImage: UIImage?
    let completion: ((String) -> Void)?
    
    var trimmedName: String {
        name.trimmingCharacters(in: .whitespaces)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            image?
                .resizable()
                .scaledToFit()
            
            Form {
                TextField("Enter image name", text: $name)
                
                Button("Save") {
                    completion?(trimmedName)
                    dismiss()
                }
                .disabled(trimmedName.isEmpty)
            }
        }
        .onAppear {
            guard let inputImage = inputImage else { return }
            
            image = Image(uiImage: inputImage)
        }
    }
    
    init(for image: UIImage?, completion: ((String) -> Void)?) {
        inputImage = image
        self.completion = completion
    }
}
