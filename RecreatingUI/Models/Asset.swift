//
//  Asset.swift
//  RecreatingUI
//
//  Created by Suyash Singh on 09/08/25.
//


// Asset.swift
import Foundation
struct Asset: Identifiable {
    let id = UUID()
    let name: String
    let symbol: String
    let value: String
    let change: String
    let balance: String?
}

