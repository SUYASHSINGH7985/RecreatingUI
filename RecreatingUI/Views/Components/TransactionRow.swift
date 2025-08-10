import SwiftUI

struct TransactionRow: View {
    var title: String
    var date: String
    var currency: String
    var amount: String
    var icon: String
    
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white.opacity(0.06))
                    .frame(width: 40, height: 40)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
                Text(date)
                    .foregroundColor(.white.opacity(0.5))
                    .font(.system(size: 12))
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 4) {
                Text(currency)
                    .foregroundColor(.white.opacity(0.7))
                    .font(.system(size: 12))
                Text(amount)
                    .foregroundColor(.white)
                    .font(.system(size: 14, weight: .medium))
            }
        }
        .padding()
        .background(Color.black.opacity(0.8))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct TransactionRow_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRow(title: "Receive", date: "20 March", currency: "BTC", amount: "+0.002126", icon: "arrow.down")
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
