import SwiftUI

struct PortfolioView: View {
    @StateObject private var viewModel = PortfolioViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Portfolio Card
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Portfolio Value")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                        }
                        
                        Text("₹\(viewModel.portfolioValue)")
                            .font(.system(size: 28, weight: .bold))
                        
                        // Time filters
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(["1h", "8h", "1d", "1w", "1m", "6m", "1y"], id: \.self) { filter in
                                    Button(filter) {
                                        viewModel.selectedTimeFilter = filter
                                    }
                                    .foregroundColor(viewModel.selectedTimeFilter == filter ? .blue : .gray)
                                }
                            }
                            .padding(.vertical, 4)
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    
                    // Assets List
                    ForEach(viewModel.assets) { asset in
                        AssetRow(asset: asset)
                    }
                    
                    // Transactions Header
                    HStack {
                        Text("Recent Transactions")
                            .font(.headline)
                        Spacer()
                        Text("Last 4 days")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 16)
                    
                    // Transactions List
                    ForEach(viewModel.transactions) { transaction in
                        TransactionRow(transaction: transaction)
                    }
                }
                .padding()
            }
            .navigationTitle("Portfolio")
        }
    }
}
