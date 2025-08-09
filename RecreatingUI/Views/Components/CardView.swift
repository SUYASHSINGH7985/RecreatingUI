import SwiftUI

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
