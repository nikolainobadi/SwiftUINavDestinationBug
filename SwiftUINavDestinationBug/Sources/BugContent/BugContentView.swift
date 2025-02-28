//
//  BugContentView.swift
//  SwiftUINavDestinationBug
//
//  Created by Nikolai Nobadi on 2/19/25.
//

import SwiftUI

struct BugContentView: View {
    @State private var myItem: MyItem?
    
    var body: some View {
        NavigationStack {
            Button("This path is broken") {
                myItem = .init(name: "something")
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red.opacity(0.5))
            .navigationDestination(item: $myItem) { myItem in
                ItemRouteChildStack(item: myItem)
            }
        }
    }
}


// MARK: - Preview
#Preview {
    BugContentView()
}
