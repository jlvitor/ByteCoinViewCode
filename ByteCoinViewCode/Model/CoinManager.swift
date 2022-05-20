//
//  CoinManager.swift
//  ByteCoinViewCode
//
//  Created by Jean Lucas Vitor on 03/05/22.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCurrency(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR-API-KEY-HERE"
    
    let currencyArray = [
        "AUD", "BRL","CAD","EUR",
        "GBP","HKD","IDR","ILS",
        "INR","JPY","MXN","NOK",
        "NZD","PLN","RON","RUB",
        "SEK","SGD","USD","ZAR"]
    
    var newArray: [CoinModel] = []
    
    func getCoinPrice(for coin: String) {
        currencyArray.forEach { coin in
            let urlString = "\(baseURL)/\(coin)?apikey=\(apiKey)"
            performRequest(with: urlString)
        }
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCurrency(self, coin: coin)
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            let chosenCoin = decodedData.asset_id_quote
            
            let coin = CoinModel(currency: rate, coin: chosenCoin)
            return coin
        } catch {
            return nil
        }
    }
}
