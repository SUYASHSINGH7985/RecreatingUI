import SwiftUI

@main
struct RecreatingUIApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()   // Make sure you provide your root view here inside the closure
        }
    }
}
