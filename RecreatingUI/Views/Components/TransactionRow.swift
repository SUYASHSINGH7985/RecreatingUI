//
//  TransactionRow.swift
//  RecreatingUI
//
//  Created by Suyash Singh on 09/08/25.
//


// In Views/Components/TransactionRow.swift
import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction
    
    var body: some View {
        HStack {
            Image(systemName: transaction.type == "Receive" ? "arrow.down" : "arrow.up")
                .foregroundColor(transaction.type == "Receive" ? .green : .red)
            
            VStack(alignment: .leading) {
                Text(transaction.type)
                Text(transaction.date)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(transaction.amount)
                Text(transaction.currency)
                    .font(.caption)
            }
        }
        .padding(.vertical, 8)
    }
}