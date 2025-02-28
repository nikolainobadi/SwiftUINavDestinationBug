//
//  ContentView.swift
//  SwiftUINavDestinationBug
//
//  Created by Nikolai Nobadi on 2/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("this path works") {
                    path.append(MyItem(name: "something"))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.green.opacity(0.5))
            .navigationDestination(for: MyItem.self) { myItem in
                ItemRouteChildStack(item: myItem)
            }
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
