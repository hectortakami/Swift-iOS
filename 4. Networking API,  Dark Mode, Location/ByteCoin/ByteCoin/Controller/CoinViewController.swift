//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CoinViewController: UIViewController {
    
    @IBOutlet weak var bitcoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var currencyPicker: UIPickerView!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
}

//MARK: - UIPickerViewDataSource & UIPickerViewDelegate
extension CoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    // Number of columns in UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // How many columns the picker will display
        return 1
    }
    
    // Number of rows in UIPickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // How many registers (rows) the picker will display
        return coinManager.currencyArray.count
    }
    
    // Data display for each row in UIPicker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // array[row] tells picker to choose 0..n data to display from certain array
        return coinManager.currencyArray[row]
    }
    
    // Event trigger when selection is made
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selection = coinManager.currencyArray[row]
        currencyLabel.text = selection
        coinManager.getCoinPrice(for: selection)
    }
}

//MARK: - CoinManagerDelegate
extension CoinViewController: CoinManagerDelegate {
    func didUpdateCurrency(_ coin: CoinModel) {
        DispatchQueue.main.async {
            self.bitcoinLabel.text = self.formatCurrency(value: coin.rate)
            self.currencyLabel.text = coin.currency
        }
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
    
    func formatCurrency(value: Float)->String{
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        currencyFormatter.locale = Locale(identifier: "es_MX")

        var currencyStr = currencyFormatter.string(from: NSNumber(value: value))!
        currencyStr.remove(at: currencyStr.startIndex)
        return currencyStr

    }
}
