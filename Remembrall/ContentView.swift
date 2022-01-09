//
//  ContentView.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import SwiftUI
import AVFAudio

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
                        DetailView(image: viewModel.images[item.id]!, item: item)
                    } label: {
                        HStack {
                            Image(uiImage: viewModel.images[item.id]!)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70)
                                .frame(maxHeight: 50)
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
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $inputImage)
            }
            .sheet(isPresented: $showingImageNameSheet) {
                SetName(for: inputImage) { name in
                    viewModel.add(image: inputImage, name: name)
                }
            }
            .onChange(of: inputImage) { _ in
                showingImageNameSheet = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
