import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    
    private let tabIcons = ["chart.line", "arrow.swap", "list.bullet", "wallet.pass"]
    private let tabTitles = ["Analytics", "Exchange", "Record", "Wallet"]
    
    var body: some View {
        HStack {
            ForEach(0..<tabIcons.count, id: \.self) { index in
                Button(action: {
                    selectedTab = index
                }) {
                    VStack(spacing: 4) {
                        Image(systemName: tabIcons[index])
                            .font(.system(size: 22, weight: .semibold))
                        Text(tabTitles[index])
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == index ? Color("accentBlue") : .gray)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color("cardBackground"))
        .frame(height: 60)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: -2)
    }
}
