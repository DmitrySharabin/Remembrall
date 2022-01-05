//
//  Item.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import Foundation

struct Item: Identifiable, Codable, Comparable {
    let id: UUID
    let name: String
    
    static func < (lhs: Item, rhs: Item) -> Bool {
        lhs.name < rhs.name
    }
}
