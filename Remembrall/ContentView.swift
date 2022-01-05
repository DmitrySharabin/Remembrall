//
//  ContentView.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    @State private var showingImageNameSheet = false
    @State private var imageName = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items.sorted()) { item in
                    NavigationLink {
                        DetailView(image: viewModel.images[item.id]!, name: item.name)
                    } label: {
                        HStack {
                            Image(uiImage: viewModel.images[item.id]!)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 50)
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 5)
                                )
                            
                            Text(item.name)
                        }
                    }
                }
            }
            .navigationTitle("Remembrall")
            .toolbar {
                ToolbarItem {
                    Button {
                        showingImagePicker = true
                    } label: {
                        Label("Add", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: showImageNameSheet) {
                ImagePicker(image: $inputImage)
            }
            .sheet(isPresented: $showingImageNameSheet) {
                SetName(for: inputImage) { name in
                    viewModel.add(image: inputImage, name: name)
                }
            }
        }
    }
    
    func showImageNameSheet() {
        if inputImage != nil {
            showingImageNameSheet = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
