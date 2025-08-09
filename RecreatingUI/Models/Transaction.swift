import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let type: String  // "Receive", "Sent", or "Send"
    let amount: String
    let currency: String
    let date: String
}
