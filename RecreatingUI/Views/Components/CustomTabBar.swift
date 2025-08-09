import SwiftUI
struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        HStack {
            ForEach(0..<4) { index in
                Button(action: { selectedTab = index }) {
                    VStack {
                        Image(systemName: tabIcons[index])
                        Text(tabTitles[index])
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == index ? Color("accentBlue") : .gray)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.vertical, 8)
        .background(Color("cardBackground"))
    }
    
    private let tabIcons = ["chart.line", "arrow.swap", "list.bullet", "wallet.pass"]
    private let tabTitles = ["Analytics", "Exchange", "Record", "Wallet"]
}
