import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            Image(systemName: transaction.type == "Receive" ? "arrow.down" : "arrow.up")
                .foregroundColor(transaction.type == "Receive" ? .green : .red)
                .frame(width: 30)
            
            VStack(alignment: .leading) {
                Text(transaction.type)
                    .font(.headline)
                Text(transaction.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(transaction.amount)
                    .font(.headline)
                Text(transaction.currency)
                    .font(.caption)
            }
        }
        .padding(.vertical, 8)
    }
}
