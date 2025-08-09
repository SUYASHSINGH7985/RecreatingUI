import SwiftUI

struct AssetRow: View {
    let asset: Asset
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(asset.name)
                    .font(.headline)
                Text(asset.symbol)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing) {
                Text(asset.value)
                    .font(.headline)
                Text(asset.change)
                    .foregroundColor(asset.change.hasPrefix("+") ? .green : .red)
            }
        }
        .padding(.vertical, 8)
    }
}
