import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            CryptoPortfolioView().tag(0)
            ExchangeView().tag(1)
            RecordView().tag(2)
            WalletView().tag(3)
        }
        .overlay(alignment: .bottom) {
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
