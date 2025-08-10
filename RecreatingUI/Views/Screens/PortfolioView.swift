import SwiftUI

struct CryptoPortfolioView: View {
    @State private var showFiat = true
    
    var body: some View {
        ZStack {
            Color(red: 0.05, green: 0.05, blue: 0.06)
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 20) {
                    topCard
                    timeSelector.padding(.horizontal, 16)
                    chartAreaWithMarker.frame(height: 220).padding(.horizontal, 8)
                    
                    HStack(spacing: 16) {
                        cryptoAssetCard(
                            icon: "bitcoinsign.circle",
                            name: "Bitcoin",
                            symbol: "BTC",
                            value: showFiat ? "₹75,62,502" : "₿0.021",
                            change: "+3.2%",
                            color: .orange
                        )
                        
                        cryptoAssetCard(
                            icon: "e.circle",
                            name: "Ethereum",
                            symbol: "ETH",
                            value: showFiat ? "₹1,79,102" : "Ξ0.84",
                            change: "+1.8%",
                            color: .blue
                        )
                    }
                    .padding(.horizontal, 16)
                    
                    recentTransactions.padding(.top, 16)
                    Spacer()
                }
                .padding(.top, 16)
                .padding(.bottom, 100)
            }
            
            VStack {
                Spacer()
                floatingBottomBar
                    .padding(.horizontal, 16)
                    .padding(.bottom, 24)
            }
        }
    }
    
    // MARK: - Top Card
    var topCard: some View {
        VStack(spacing: 0) {
            ZStack(alignment: .topLeading) {
                RoundedRectangle(cornerRadius: 22)
                    .fill(
                        LinearGradient(
                            colors: [
                                Color(red: 0.10, green: 0.08, blue: 0.30),
                                Color(red: 0.18, green: 0.22, blue: 0.45)
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .frame(height: 150)
                    .overlay(
                        RoundedRectangle(cornerRadius: 22)
                            .stroke(Color.white.opacity(0.1), lineWidth: 1)
                    )
                    .shadow(color: .black.opacity(0.3), radius: 10, y: 5)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Image(systemName: "line.horizontal.3")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Spacer()
                        
                        Image(systemName: "bell")
                            .font(.system(size: 18))
                            .foregroundColor(.white.opacity(0.9))
                    }
                    
                    VStack(alignment: .leading, spacing: 6) {
                        HStack(spacing: 6) {
                            Text("Portfolio Value")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white.opacity(0.8))
                            
                            Image(systemName: "chevron.right")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.white.opacity(0.7))
                        }
                        
                        HStack(alignment: .firstTextBaseline) {
                            Text(showFiat ? "₹" : "₿")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(showFiat ? "1,57,342.05" : "0.0425")
                                .font(.system(size: 32, weight: .bold))
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                            HStack(spacing: 20) {
                                Button(action: { showFiat = true }) {
                                    Image(systemName: "banknote")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(showFiat ? .white : .white.opacity(0.5))
                                }
                                
                                Button(action: { showFiat = false }) {
                                    Image(systemName: "bitcoinsign")
                                        .font(.system(size: 20, weight: .medium))
                                        .foregroundColor(!showFiat ? .white : .white.opacity(0.5))
                                }
                            }
                        }
                    }
                }
                .padding(16)
            }
            .padding(.horizontal, 16)
        }
    }
    
    func cryptoAssetCard(icon: String, name: String, symbol: String, value: String, change: String, color: Color) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                    .foregroundColor(color)
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack(spacing: 6) {
                        Text(name)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                        
                        Text(change)
                            .font(.system(size: 12))
                            .foregroundColor(change.hasPrefix("+") ? .green : .red)
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(change.hasPrefix("+") ? Color.green.opacity(0.2) : Color.red.opacity(0.2))
                            .cornerRadius(4)
                    }
                    Text(symbol)
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.7))
                }
            }
            
            Text(value)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.white)
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .background(Color.black)
        .cornerRadius(12)
    }
    
    // MARK: - Time Selector
    var timeSelector: some View {
        HStack(spacing: 0) {
            ForEach(["1h", "8h", "1d", "1w", "1m", "6m", "1y"], id: \.self) { period in
                Text(period)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(period == "6m" ? .white : .white.opacity(0.5))
                    .frame(maxWidth: .infinity)
            }
        }
    }
    
    // MARK: - Ultra Smooth Chart with Catmull-Rom Spline
    var chartAreaWithMarker: some View {
        ZStack {
            // Remove the bar background for cleaner look
            GeometryReader { geometry in
                let points = [
                    CGPoint(x: 0, y: geometry.size.height * 0.7),
                    CGPoint(x: geometry.size.width * 0.2, y: geometry.size.height * 0.7),
                    CGPoint(x: geometry.size.width * 0.4, y: geometry.size.height * 0.9),
                    CGPoint(x: geometry.size.width * 0.6, y: geometry.size.height * 0.55),
                    CGPoint(x: geometry.size.width * 0.8, y: geometry.size.height * 0.3),
                    CGPoint(x: geometry.size.width, y: geometry.size.height * 0.25)
                ]
                
                // Catmull-Rom Spline for perfectly smooth curve
                Path { path in
                    guard points.count >= 4 else { return }
                    
                    path.move(to: points[1])
                    
                    for i in 1..<points.count-2 {
                        let p0 = points[i-1]
                        let p1 = points[i]
                        let p2 = points[i+1]
                        let p3 = points[i+2]
                        
                        // Catmull-Rom control points
                        let control1 = CGPoint(
                            x: p1.x + (p2.x - p0.x) / 3,
                            y: p1.y + (p2.y - p0.y) / 3
                        )
                        
                        let control2 = CGPoint(
                            x: p2.x - (p3.x - p1.x) / 3,
                            y: p2.y - (p3.y - p1.y) / 3
                        )
                        
                        path.addCurve(to: p2, control1: control1, control2: control2)
                    }
                }
                .stroke(
                    Color.green, // Solid green color as requested
                    style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round)
                )
                .shadow(color: .green.opacity(0.3), radius: 8, x: 0, y: 4)
                
                // Vertical marker line
                Path { path in
                    let xPos = geometry.size.width * 0.72
                    path.move(to: CGPoint(x: xPos, y: 0))
                    path.addLine(to: CGPoint(x: xPos, y: geometry.size.height))
                }
                .stroke(Color.white.opacity(100), lineWidth: 1)

                
                // Marker label
                VStack(spacing: 1) {
                    Text("24 March")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundColor(.white.opacity(0.4))
                    Text("₹1,14,200")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white.opacity(0.9))
                }
                .position(x: geometry.size.width * 0.72-60, y: -0.5)
            }
        }
    }
    
    // MARK: - Recent Transactions
    var recentTransactions: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recent Transactions")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white.opacity(0.8))
                .padding(.horizontal, 16)
            
            HStack(spacing: 12) {
                Image(systemName: "arrow.down.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.green)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Received Bitcoin")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                    Text("Today, 10:42 AM")
                        .font(.system(size: 12))
                        .foregroundColor(.white.opacity(0.6))
                }
                
                Spacer()
                
                Text("+0.005 BTC")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.green)
            }
            .padding(16)
        }
    }
    
    // MARK: - Bottom Bar
    var floatingBottomBar: some View {
        HStack(spacing: 16) {
            HStack(spacing: 0) {
                bottomBarButton(icon: "chart.line.uptrend.xyaxis", title: "Analytics", active: true)
                bottomBarButton(icon: "arrow.2.squarepath", title: "Exchange")
                bottomBarButton(icon: "record.circle", title: "Records")
                bottomBarButton(icon: "wallet.pass", title: "Wallet")
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.08))
            .cornerRadius(24)
            
            Button(action: {}) {
                Image(systemName: "plus")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .clipShape(Circle())
                    .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
            }
        }
    }
    
    func bottomBarButton(icon: String, title: String, active: Bool = false) -> some View {
        Button(action: {}) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: active ? .bold : .regular))
                    .foregroundColor(active ? .white : .white.opacity(0.6))
                
                Text(title)
                    .font(.system(size: 10, weight: active ? .bold : .medium))
                    .foregroundColor(active ? .white : .white.opacity(0.6))
            }
            .frame(maxWidth: .infinity)
        }
    }
}

struct CryptoPortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        CryptoPortfolioView()
            .preferredColorScheme(.dark)
    }
}
