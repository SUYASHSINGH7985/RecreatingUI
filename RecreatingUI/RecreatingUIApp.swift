import SwiftUI

@main  // ← Only ONE file in project should have this
struct RecreatingUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()  // Your root view
        }
    }
}
