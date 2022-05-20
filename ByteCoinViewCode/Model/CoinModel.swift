//
//  CoinModel.swift
//  ByteCoinViewCode
//
//  Created by Jean Lucas Vitor on 03/05/22.
//

import Foundation

struct CoinModel {
    let currency: Float
    let coin: String
    
    var currencyString: String {
        return String(format: "%.2f", currency)
    }
}
