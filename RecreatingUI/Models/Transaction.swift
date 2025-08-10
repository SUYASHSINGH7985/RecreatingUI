import Foundation

// Represents a single transaction in the portfolio
struct Transaction: Identifiable {
    // Unique identifier for each transaction (automatically generated)
    let id = UUID()
    
    // The kind of transaction — like "Receive", "Sent", or "Send"
    let type: String
    
    // How much currency was moved in this transaction
    let amount: String
    
    // The currency type, e.g., "USD", "BTC", "ETH"
    let currency: String
    
    // When this transaction happened (stored as a string for simplicity)
    let date: String
}
