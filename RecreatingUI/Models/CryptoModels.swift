import Foundation
struct CryptoAsset: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let value: String
    let changePercentage: String
}

struct Transaction: Identifiable {
    let id = UUID()
    let type: String // "Receive" or "Send"
    let amount: String
    let currency: String
    let date: String
}
