import SwiftUI

class PortfolioViewModel: ObservableObject {
    @Published var portfolioValue = "1,57,342.05"
    @Published var selectedTimeFilter = "1d"
    
    @Published var assets = [
        Asset(name: "Bitcoin", symbol: "BTC", value: "75,62,502.14", change: "+3.2%", balance: nil),
        Asset(name: "Ether", symbol: "ETH", value: "1,79,102.50", change: "+3.2%", balance: nil)
    ]
    
    @Published var transactions = [
        Transaction(type: "Receive", amount: "+0.002126", currency: "BTC", date: "20 March"),
        Transaction(type: "Sent", amount: "-0.003126", currency: "ETH", date: "19 March"),
        Transaction(type: "Send", amount: "-0.02126", currency: "LTC", date: "18 March")
    ]
}
