//
//  DetailView.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import SwiftUI

struct DetailView: View {
    
    let image: UIImage
    let name: String
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .scaledToFit()
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(name)
    }
}
