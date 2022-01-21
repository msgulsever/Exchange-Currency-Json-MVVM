//
//  DovizCurrency.swift
//  DovizConverterApp
//
//  Created by Muhammed Selimhan gülsever on 19.01.2022.
//

import Foundation

struct CurrencyModel: Codable {
    let success: Bool
    let timestamp: Int
    let base, date: String
    let rates: [String: Double]

    
    
}

