import SwiftUI

// A reusable row view to display an individual asset’s info in a list
struct AssetRow: View {
    let asset: Asset  // The asset data to display
    
    var body: some View {
        HStack {
            // Left side: asset name and symbol
            VStack(alignment: .leading) {
                Text(asset.name)
                    .font(.headline)  // Make the name stand out
                
                Text(asset.symbol)
                    .font(.subheadline)
                    .foregroundColor(.gray)  // Subtle, less prominent text
            }
            
            Spacer()  // Push the price info to the right side
            
            // Right side: amount owned and its current value in USD
            VStack(alignment: .trailing) {
                Text("\(asset.amount, specifier: "%.4f")")  // Show amount with 4 decimals
                
                Text("$\(asset.priceUSD * asset.amount, specifier: "%.2f")")
                    .foregroundColor(.green)  // Green to indicate value or profit
            }
        }
        .padding()  // Add some breathing room inside the row
    }
}
