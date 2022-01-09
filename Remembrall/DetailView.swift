//
//  DetailView.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import SwiftUI
import MapKit

struct DetailView: View {
    
    @State private var mapRegion: MKCoordinateRegion
    
    let image: UIImage
    let item: Item
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(5)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)
                .frame(maxWidth: .infinity)
                .padding()
                
                
            Map(coordinateRegion: $mapRegion, annotationItems: [item]) {
                MapMarker(coordinate: $0.coordinate)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .frame(maxHeight: 250)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(item.name)
    }
    
    init(image: UIImage, item: Item) {
        self.image = image
        self.item = item
        
        self._mapRegion = State(wrappedValue: MKCoordinateRegion(center: item.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)))
    }
}
