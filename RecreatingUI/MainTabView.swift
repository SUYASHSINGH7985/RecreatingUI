import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0

    var body: some View {
        ZStack(alignment: .bottom) {
            // Using ViewBuilder closure instead of Group to resolve generic issues
            contentView
            
            CustomTabBar(selectedTab: $selectedTab)
                .padding(.bottom, 8)
                .background(Color.black.edgesIgnoringSafeArea(.bottom))
        }
    }

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
            CryptoPortfolioView()
        }
    }
}
