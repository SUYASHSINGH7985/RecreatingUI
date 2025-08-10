import SwiftUI

// A simple card container to wrap any content with padding, background, rounded corners, and shadow
// Keeps UI consistent and looks neat — pretty standard stuff
struct CardView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .padding()
            .background(Color("cardBackground"))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
    }
}
