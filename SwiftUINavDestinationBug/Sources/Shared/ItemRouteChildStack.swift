//
//  ItemRouteChildStack.swift
//  SwiftUINavDestinationBug
//
//  Created by Nikolai Nobadi on 2/19/25.
//

import SwiftUI

struct ItemRouteChildStack: View {
    let item: MyItem
    
    var body: some View {
        List(ItemRoute.allCases, id: \.rawValue) { route in
            NavigationLink(route.rawValue.capitalized, value: route)
        }
        .navigationTitle(item.name)
        .navigationDestination(for: ItemRoute.self) { route in
            switch route {
            case .first:
                Text("First View")
            case .second:
                Text("Second View")
            case .third:
                Text("Third View")
            }
        }
    }
}
