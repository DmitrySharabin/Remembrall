//
//  FileManager-DocumentsDirectory.swift
//  Remembrall
//
//  Created by Dmitry Sharabin on 05.01.2022.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}
