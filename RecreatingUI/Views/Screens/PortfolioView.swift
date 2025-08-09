import SwiftUI
struct PortfolioView: View {
    @StateObject private var vm = PortfolioViewModel()
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Portfolio Card
                CardView {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Portfolio Value")
                                .foregroundColor(Color("textSecondary"))
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        Text("₹1,57,342.05")
                            .font(.system(size: 28, weight: .bold))
                        
                        // Time filters
                        HStack(spacing: 20) {
                            ForEach(["1h", "1d", "1w", "1m"], id: \.self) { period in
                                Button(period) { vm.selectedPeriod = period }
                                    .foregroundColor(vm.selectedPeriod == period ? Color("accentBlue") : Color("textSecondary"))
                            }
                        }
                    }
                }
                
                // Assets List
                ForEach(vm.assets) { asset in
                    AssetRow(asset: asset)
                }
                
                // Transactions Header
                HStack {
                    Text("Recent Transactions")
                        .font(.headline)
                    Spacer()
                }
                .padding(.top, 16)
                
                // Transactions List
                ForEach(vm.transactions.prefix(3)) { transaction in
                    TransactionRow(transaction: transaction)
                }
            }
            .padding()
        }
        .background(Color("backgroundPrimary"))
        .navigationTitle("Portfolio")
    }
}
