import SwiftUI

@main
struct RecreatingUIApp: App {
    var body: some Scene {
        WindowGroup {
            CryptoPortfolioView()   // Make sure you provide your root view here inside the closure
        }
    }
}
