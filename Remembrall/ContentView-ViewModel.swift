//
//  ContentView-ViewModel.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import Foundation
import UIKit


extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published private(set) var items: [Item]
        private(set) var images: [UUID: UIImage]
        
        private let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedImages")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                let decodedData = try JSONDecoder().decode([Item].self, from: data)
                
                var loadedImages = [UUID: UIImage]()
                for item in decodedData {
                    let path = FileManager.documentsDirectory.appendingPathComponent(item.id.uuidString)
                    let data = try Data(contentsOf: path)
                    
                    loadedImages[item.id] = UIImage(data: data)
                }
                
                items = decodedData
                images = loadedImages
            } catch {
                items = []
                images = [:]
            }
        }
        
        func add(image: UIImage?, name: String) {
            guard let image = image else { return }
            
            let id = UUID()
            let newItem = Item(id: id, name: name)
            
            items.append(newItem)
            images[id] = image
            
            save()
        }
        
        private func save() {
            do {
                let data = try JSONEncoder().encode(items)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
                
                for item in items {
                    let path = FileManager.documentsDirectory.appendingPathComponent(item.id.uuidString)
                    
                    if let jpegData = images[item.id]?.jpegData(compressionQuality: 0.8) {
                        try jpegData.write(to: path, options: [.atomic, .completeFileProtection])
                    }
                }
            } catch {
                print("Unable to save data.")
            }
        }
    }
}
