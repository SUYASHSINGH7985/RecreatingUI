import Foundation
struct CryptoAsset: Identifiable {
    let id = UUID()
    let symbol: String
    let name: String
    let value: String
    let changePercentage: String
}
