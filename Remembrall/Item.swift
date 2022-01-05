//
//  Item.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import Foundation

struct Item: Identifiable, Codable {
    let id: UUID
    let name: String
}
