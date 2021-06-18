//
//  Item.swift
//  Todoy
//
//  Created by MiciH on 6/17/21.
//

import Foundation

class Item: Encodable, Decodable /*Codable*/ {
    var title: String
    var done: Bool
    
    init(title: String, done: Bool) {
        self.title = title
        self.done = done
    }
}
