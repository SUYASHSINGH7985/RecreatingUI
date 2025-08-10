import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0  // track which tab is selected
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Show the main content based on selected tab
            contentView
            
            // Custom bottom tab bar with a bit of padding and black background
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 8)
                .background(Color.black.edgesIgnoringSafeArea(.bottom))
        }
    }
    
    // Switch between different views depending on selected tab
    @ViewBuilder
    private var contentView: some View {
        switch selectedTab {
        case 0:
            CryptoPortfolioView()
        case 1:
            ExchangeView()
        case 2:
            RecordView()
        case 3:
            WalletView()
        default:
            CryptoPortfolioView()  // fallback to portfolio just in case
        }
    }
}
