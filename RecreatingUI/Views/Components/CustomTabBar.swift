import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    @Namespace private var animation
    
    private let tabIcons = ["chart.xyaxis.line", "arrow.2.circlepath", "waveform", "creditcard.fill"]
    private let tabTitles = ["Analytics", "Exchange", "Record", "Wallet"]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Background (clear to allow gradient from parent view)
            Color.clear
            
            HStack(spacing: 0) {
                // Tab container with rounded rectangle
                HStack(spacing: 0) {
                    ForEach(0..<tabIcons.count, id: \.self) { index in
                        Button(action: {
                            withAnimation(.interactiveSpring(response: 0.3, dampingFraction: 0.7)) {
                                selectedTab = index
                            }
                        }) {
                            VStack(spacing: 4) {
                                Image(systemName: tabIcons[index])
                                    .font(.system(size: 20, weight: .medium))
                                    .frame(width: 24, height: 24)
                                
                                Text(tabTitles[index])
                                    .font(.system(size: 10, weight: .medium))
                                    .kerning(-0.2)
                            }
                            .foregroundColor(selectedTab == index ? .white : Color(white: 0.6))
                            .padding(.vertical, 6)
                            .padding(.horizontal, 12)
                            .background(
                                Group {
                                    if selectedTab == index {
                                        Capsule()
                                            .fill(Color(red: 11/255, green: 11/255, blue: 153/255)) // #0B0B99
                                            .matchedGeometryEffect(id: "tab", in: animation)
                                    }
                                }
                            )
                        }
                        .frame(maxWidth: .infinity)
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.horizontal, 8)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(Color.black.opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.white.opacity(0.1), lineWidth: 0.5)
                        )
                        .shadow(color: Color.black.opacity(0.25), radius: 12, x: 0, y: 6)
                )
                .frame(height: 60)
                
                // Plus button, separate and to the right, only visible for Analytics
                if selectedTab == 0 {
                    Button(action: {
                        // Plus button action here
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 44, height: 44)
                            
                            Image(systemName: "plus")
                                .font(.system(size: 20, weight: .bold))
                                .foregroundColor(Color.blue)
                        }
                        .shadow(color: Color.blue.opacity(0.3), radius: 6, y: 3)
                    }
                    .offset(y: -8) // Slightly raised effect
                    .padding(.leading, 8) // Gap from the tab container
                    .padding(.trailing, 12) // Margin from the screen edge
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(height: 60)
        }
        .frame(height: 70)
        .padding(.horizontal, 8)
    }
}

// Example integration into ExchangeView


struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ExchangeView()
            .preferredColorScheme(.dark)
    }
}
