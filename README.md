# SwiftUINavDestinationBug  

This project demonstrates a bug in SwiftUI related to nested navigation when using different `.navigationDestination` modifers in the same hierarchy.  

## Overview  

The app consists of two tabs:  

- **"Ok" Tab** ✅ (Green)  
  - Uses `NavigationPath` to navigate to `ItemRouteChildStack`.  
  - Further navigation inside `ItemRouteChildStack` using `NavigationLink` works as expected.  

- **"Bug" Tab** ❌ (Red)  
  - Uses `.navigationDestination(item:)` to navigate to `ItemRouteChildStack`.  
  - Further navigation inside `ItemRouteChildStack` using `NavigationLink` does not work.  

## Reproducing the Issue  

1. Run the app.  
2. In the **"Ok" Tab**, tap the button.  
   - The app navigates to `ItemRouteChildStack`.  
   - Selecting any item in the list successfully navigates to another view. ✅  
3. In the **"Bug" Tab**, tap the button.  
   - The app navigates to `ItemRouteChildStack`.  
   - Selecting any item in the list does **not** navigate to a new view. ❌  

## Code Breakdown  

### Working Navigation (Uses `NavigationPath`) 
```swift
struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            Button("this path works") {
                path.append(MyItem(name: "something"))
            }
            .navigationDestination(for: MyItem.self) { myItem in
                ItemRouteChildStack(item: myItem)
            }
        }
    }
}
```

- `NavigationPath` correctly manages navigation state.
- Further navigation inside `ItemRouteChildStack` works.

### Broken Navigation (Uses .navigationDestination(item:))
```swift 
struct BugContentView: View {
    @State private var myItem: MyItem?

    var body: some View {
        NavigationStack {
            Button("This path is broken") {
                myItem = MyItem(name: "something")
            }
            .navigationDestination(item: $myItem) { myItem in
                ItemRouteChildStack(item: myItem)
            }
        }
    }
}
```
- The initial navigation works.
- However, further navigation inside `ItemRouteChildStack` fails.

## Expected Behavior  

Both approaches should allow further navigation inside `ItemRouteChildStack`.  
