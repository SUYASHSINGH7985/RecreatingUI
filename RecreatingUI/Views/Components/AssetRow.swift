//
//  AssetRow.swift
//  RecreatingUI
//
//  Created by Suyash Singh on 09/08/25.
//


// In Views/Components/AssetRow.swift
import SwiftUI

struct AssetRow: View {
    let asset: CryptoAsset
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(asset.name)
                    .font(.headline)
                Text(asset.value)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text(asset.changePercentage)
                .foregroundColor(asset.changePercentage.hasPrefix("+") ? .green : .red)
        }
        .padding(.vertical, 8)
    }
}