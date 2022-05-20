//
//  ViewController.swift
//  ByteCoinViewCode
//
//  Created by Jean Lucas Vitor on 03/05/22.
//

import UIKit

class ViewController: UIViewController {
    
    var screen: CoinScreen?
    var coinManager = CoinManager()
    
    override func loadView() {
        self.screen = CoinScreen()
        self.screen?.configDelegate(delegate: self, dataSource: self)
        self.view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.coinManager.delegate = self
    }
}

//MARK: - CoinManagerDelegate
extension ViewController: CoinManagerDelegate {
    func didFailWithError(error: Error) {
//        print(error)
    }
    
    func didUpdateCurrency(_ coinManager: CoinManager, coin: CoinModel) {
        DispatchQueue.main.async {
            self.screen?.coinLabel.text = coin.currencyString
            self.screen?.currencyLabel.text = coin.coin
            self.coinManager.newArray.append(coin)
            print(self.coinManager.newArray)
        }
    }
}

//MARK: - UIPickerViewDelegate
extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectCurrency)
    }
}

//MARK: - UIPickerViewDataSource
extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}
