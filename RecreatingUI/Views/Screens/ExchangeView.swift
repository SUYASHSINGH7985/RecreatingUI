import SwiftUI

struct ExchangeView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            VStack(spacing: 0) {
                // MARK: - Top Bar
                HStack {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Spacer()
                    Image(systemName: "bell")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // MARK: - Blue Gradient Card
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 108/255, green: 64/255, blue: 255/255),
                            Color(red: 44/255, green: 29/255, blue: 170/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    .frame(height: 180)
                    .shadow(color: Color.purple.opacity(0.3), radius: 20, x: 0, y: 10)
                    
                    VStack(spacing: 8) {
                        Text("INR")
                            .font(.system(size: 12, weight: .medium))
                            .padding(.vertical, 4)
                            .padding(.horizontal, 12)
                            .background(Color.white.opacity(0.15))
                            .clipShape(Capsule())
                            .foregroundColor(.white)
                        
                        Text("1,57,342.05")
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)
                        
                        HStack(spacing: 4) {
                            Text("₹ 1,342")
                                .font(.system(size: 14))
                                .foregroundColor(.white.opacity(0.8))
                            Text("+4.6%")
                                .font(.system(size: 14))
                                .foregroundColor(.green)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 10)
                
                // MARK: - Action Buttons
                HStack(spacing: 24) {
                    CircleButton(icon: "arrow.up")
                    CircleButton(icon: "plus")
                    CircleButton(icon: "arrow.down")
                }
                .padding(.top, -22)
                
                // MARK: - Transactions Header
                HStack {
                    Text("Transactions")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                    Spacer()
                    Text("Last 4 days")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.7))
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                // MARK: - Transactions List
                VStack(spacing: 12) {
                    TransactionRow(title: "Receive", date: "20 March", currency: "BTC", amount: "+0.002126", icon: "arrow.down")
                    TransactionRow(title: "Sent", date: "19 March", currency: "ETH", amount: "+0.003126", icon: "arrow.up")
                    TransactionRow(title: "Send", date: "18 March", currency: "LTC", amount: "+0.02126", icon: "arrow.up")
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                Spacer()
                
              
            }
        }
    }
}

// MARK: - Reusable Components

struct CircleButton: View {
    var icon: String
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.white.opacity(0.08))
                .frame(width: 50, height: 50)
            Image(systemName: icon)
                .foregroundColor(.white)
        }
    }
}

struct NavItem: View {
    var icon: String
    var label: String
    var isSelected: Bool
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 18))
                .foregroundColor(isSelected ? .blue : .white.opacity(0.7))
            Text(label)
                .font(.system(size: 12))
                .foregroundColor(isSelected ? .blue : .white.opacity(0.7))
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .fill(Color.black.opacity(0.8))
                .shadow(color: Color.blue.opacity(0.5), radius: 20, x: 0, y: 5)
        )

    }
}

// MARK: - Preview
struct ExchangeView_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
            .preferredColorScheme(.dark)
    }
}
