//
//  TabBar.swift
//  RecreatingUI
//
//  Created by Suyash Singh on 09/08/25.
//


// TabBar.swift
import SwiftUI

struct TabBar: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            PortfolioView()
                .tabItem {
                    Label("Analytics", systemImage: "chart.bar")
                }
                .tag(0)
            
            ExchangeView()
                .tabItem {
                    Label("Exchange", systemImage: "arrow.left.arrow.right")
                }
                .tag(1)
            
            Text("Record")
                .tabItem {
                    Label("Record", systemImage: "list.bullet")
                }
                .tag(2)
            
            Text("Wallet")
                .tabItem {
                    Label("Wallet", systemImage: "wallet.pass")
                }
                .tag(3)
        }
        .accentColor(.blue)
    }
}