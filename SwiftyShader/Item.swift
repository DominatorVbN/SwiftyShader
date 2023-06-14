//
//  Item.swift
//  SwiftyShader
//
//  Created by Amit Samant on 15/06/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
