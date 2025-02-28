//
//  SwiftUINavDestinationBugApp.swift
//  SwiftUINavDestinationBug
//
//  Created by Nikolai Nobadi on 2/19/25.
//

import SwiftUI

@main
struct SwiftUINavDestinationBugApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Ok", systemImage: "checkmark.seal.fill")
                    }
                
                BugContentView()
                    .tabItem {
                        Label("Bug", systemImage: "ladybug.fill")
                    }
            }
        }
    }
}
