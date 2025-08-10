import SwiftUI

struct ExchangeModalView: View {
    @Binding var isPresented: Bool
    @State private var ethAmount: String = "2.640"
    @State private var inrAmount: String = "4,65,006.44"
    
    var body: some View {
        VStack(spacing: 0) {
            // header stuff
            HStack {
                Text("Exchange")
                    .font(.system(size: 20, weight: .semibold))
                Spacer()
                Button(action: { isPresented = false }) {
                    Image(systemName: "xmark")
                        .font(.system(size: 16, weight: .bold))
                }
            }
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 16)
            
            // eth input section
            VStack(spacing: 12) {
                HStack {
                    Text("ETH ▼")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Text("Send")
                        .font(.system(size: 14))
                }
                .foregroundColor(.white.opacity(0.8))
                
                TextField("", text: $ethAmount)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .keyboardType(.decimalPad)
                
                HStack {
                    Text("Balance")
                        .font(.system(size: 14))
                    Text("10.254")
                        .font(.system(size: 14, weight: .medium))
                }
                .foregroundColor(.white.opacity(0.6))
            }
            .padding(16)
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
            .cornerRadius(12)
            .padding(.horizontal, 16)
            
            // button to swap values, doesn't do anything yet
            Button(action: {}) {
                Image(systemName: "arrow.up.arrow.down")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
            }
            .padding(.vertical, 8)
            
            // inr input section, same deal as eth
            VStack(spacing: 12) {
                HStack {
                    Text("INR ▼")
                        .font(.system(size: 16, weight: .medium))
                    Spacer()
                    Text("Receive")
                        .font(.system(size: 14))
                }
                .foregroundColor(.white.opacity(0.8))
                
                TextField("", text: $inrAmount)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
                    .keyboardType(.decimalPad)
                
                HStack {
                    Text("Balance")
                        .font(.system(size: 14))
                    Text("4,35,804")
                        .font(.system(size: 14, weight: .medium))
                }
                .foregroundColor(.white.opacity(0.6))
            }
            .padding(16)
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
            .cornerRadius(12)
            .padding(.horizontal, 16)
            
            // showing exchange rates and fees and all that
            VStack(spacing: 12) {
                HStack {
                    Text("Rate")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()
                    Text("1ETH = ₹ 1,76,138.80")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
                
                HStack {
                    Text("Spread")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()
                    Text("0.2%")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
                
                HStack {
                    Text("Gas fee")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()
                    Text("₹ 422.73")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white)
                }
                
                Divider()
                    .background(Color.white.opacity(0.2))
                
                HStack {
                    Text("You will receive")
                        .font(.system(size: 14))
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()
                    Text("₹ 1,75,716.07")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.green)
                }
            }
            .padding(16)
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
            .cornerRadius(12)
            .padding(16)
            
            // main exchange button, no logic yet tho
            Button(action: {}) {
                Text("Exchange")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 24)
        }
        .background(Color.black)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
        .padding(.horizontal, 16)
    }
}

struct ExchangeModalView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ExchangeModalView(isPresented: .constant(true))
        }
        .preferredColorScheme(.dark)
    }
}
