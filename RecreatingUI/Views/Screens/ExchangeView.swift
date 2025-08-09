// ExchangeView.swift
import SwiftUI

struct ExchangeView: View {
    @State private var ethAmount = "2.640"
    @State private var inrAmount = "4,65,006.44"
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // ETH Section
                VStack(alignment: .leading) {
                    Text("ETH").font(.headline)
                    TextField("", text: $ethAmount)
                        .font(.system(size: 24, weight: .bold))
                    
                    HStack {
                        Text("Send")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Balance: 10,254")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // INR Section
                VStack(alignment: .leading) {
                    Text("INR").font(.headline)
                    TextField("", text: $inrAmount)
                        .font(.system(size: 24, weight: .bold))
                    
                    HStack {
                        Text("Receive")
                            .foregroundColor(.gray)
                        Spacer()
                        Text("Balance: 4,35,804")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Exchange Details
                VStack(spacing: 12) {
                    HStack {
                        Text("Rate")
                        Spacer()
                        Text("1ETH = ₹1,76,138.80")
                    }
                    
                    HStack {
                        Text("Spread")
                        Spacer()
                        Text("0.2%")
                    }
                    
                    HStack {
                        Text("Gas fee")
                        Spacer()
                        Text("₹422.73")
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("You will receive")
                            .font(.headline)
                        Spacer()
                        Text("₹1,75,716.07")
                            .font(.headline)
                    }
                }
                .padding()
                
                Button("Exchange") {
                    // Exchange logic
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("Exchange")
    }
}
