//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Hector Takami on 06/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinModel {
    var currency: String
    var rate: Float
    var rateStr: String {
        return String(format: "%.2f", rate)
    }
}
