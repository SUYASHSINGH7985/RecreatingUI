//
//  PortfolioViewModel.swift
//  RecreatingUI
//
//  Created by Suyash Singh on 09/08/25.
//


import Combine

class PortfolioViewModel: ObservableObject {
    @Published var selectedPeriod = "1d"
    @Published var assets: [CryptoAsset] = [
        CryptoAsset(symbol: "BTC", name: "Bitcoin", value: "₹75,62,502.14", changePercentage: "+3.2%"),
        CryptoAsset(symbol: "ETH", name: "Ethereum", value: "₹1,79,102.50", changePercentage: "+1.8%")
    ]
    
    @Published var transactions: [Transaction] = [
        Transaction(type: "Receive", amount: "+0.002126", currency: "BTC", date: "20 March"),
        Transaction(type: "Send", amount: "-0.003126", currency: "ETH", date: "19 March")
    ]
}