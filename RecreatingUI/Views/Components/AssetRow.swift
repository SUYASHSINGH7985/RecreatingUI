import SwiftUI

struct AssetRow: View {
    let asset: Asset

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(asset.name).font(.headline)
                Text(asset.symbol).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(asset.amount, specifier: "%.4f")")
                Text("$\(asset.priceUSD * asset.amount, specifier: "%.2f")")
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}
