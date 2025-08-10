import SwiftUI

struct ExchangeView: View {
    @State private var showExchangeModal = false
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 24) {
                    // MARK: - Top Navigation
                    TopNavigationView()
                    
                    // MARK: - Balance Card
                    BalanceCardView()
                    
                    // MARK: - Action Buttons
                    ActionButtonsView(showExchangeModal: $showExchangeModal)
                    
                    // MARK: - Transactions
                    TransactionsSectionView()
                }
                .padding(.horizontal, 16)
                .padding(.top, 16)
                .padding(.bottom, 24)
            }
        }
        .sheet(isPresented: $showExchangeModal) {
            ExchangeModalView(isPresented: $showExchangeModal)
                .preferredColorScheme(.dark)
        }
    }
}

// MARK: - Top Navigation
struct TopNavigationView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 20, weight: .medium))
            Spacer()
            Image(systemName: "bell")
                .font(.system(size: 20, weight: .medium))
        }
        .foregroundColor(.white)
    }
}

// MARK: - Balance Card
struct BalanceCardView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(red: 108/255, green: 64/255, blue: 255/255),
                    Color(red: 44/255, green: 29/255, blue: 170/255)
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .frame(height: 220)
            .shadow(color: Color.purple.opacity(0.3), radius: 20, x: 0, y: 10)
            
            VStack(spacing: 20) {
                CurrencyBadgeView(currency: "INR")
                
                VStack(spacing: 8) {
                    Text("1,57,342.05")
                        .font(.system(size: 48, weight: .bold, design: .rounded))
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    
                    HStack(spacing: 8) {
                        Text("₹ 1,342")
                            .font(.system(size: 18, weight: .medium))
                        Text("+4.6%")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.green)
                    }
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal, 24)
        }
        .padding(.horizontal, 8)
    }
}

// MARK: - Currency Badge
struct CurrencyBadgeView: View {
    let currency: String
    
    var body: some View {
        Text(currency)
            .font(.system(size: 12, weight: .medium))
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(Color.white.opacity(0.15))
            .clipShape(Capsule())
            .foregroundColor(.white)
    }
}

// MARK: - Action Buttons
struct ActionButtonsView: View {
    @Binding var showExchangeModal: Bool
    
    var body: some View {
        HStack {
            Spacer()
            CircleButton(icon: "arrow.up") {
                // Optional: Handle "arrow.up" button action
            }
            Spacer()
            CircleButton(icon: "plus") {
                // Open the ExchangeModalView
                showExchangeModal = true
            }
            Spacer()
            CircleButton(icon: "arrow.down") {
                // Optional: Handle "arrow.down" button action
            }
            Spacer()
        }
        .padding(.top, -24)
    }
}

struct CircleButton: View {
    let icon: String
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(Color.white.opacity(0.08))
                    .frame(width: 56, height: 56)
                
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

// MARK: - Transactions Section
struct TransactionsSectionView: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Transactions")
                    .font(.system(size: 16, weight: .semibold))
                Spacer()
                Text("Last 4 days")
                    .font(.system(size: 14))
            }
            .foregroundColor(.white.opacity(0.8))
            
            VStack(spacing: 12) {
                TransactionRow(
                    title: "Received Bitcoin",
                    date: "20 March, 10:42 AM",
                    currency: "BTC",
                    amount: "+0.002126",
                    icon: "arrow.down"
                )
                
                TransactionRow(
                    title: "Sent Ethereum",
                    date: "19 March, 3:15 PM",
                    currency: "ETH",
                    amount: "-0.003126",
                    icon: "arrow.up"
                )
                
                TransactionRow(
                    title: "Sent Litecoin",
                    date: "18 March, 11:30 AM",
                    currency: "LTC",
                    amount: "-0.02126",
                    icon: "arrow.up"
                )
            }
        }
    }
}


