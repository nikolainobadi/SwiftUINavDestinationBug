//
//  MyItem.swift
//  SwiftUINavDestinationBug
//
//  Created by Nikolai Nobadi on 2/19/25.
//

import Foundation

struct MyItem: Identifiable, Hashable {
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}
