//
//  Item.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import Foundation
import CoreLocation

struct Item: Identifiable, Codable, Comparable {
    let id: UUID
    let name: String
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func < (lhs: Item, rhs: Item) -> Bool {
        lhs.name < rhs.name
    }
    
    static func == (lhs: Item, rhs: Item) -> Bool {
        lhs.id == rhs.id
    }
}
