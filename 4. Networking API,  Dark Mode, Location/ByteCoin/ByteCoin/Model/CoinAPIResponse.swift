//
//  CoinAPIResponse.swift
//  ByteCoin
//
//  Created by Hector Takami on 06/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CoinAPIResponse: Codable {
    let asset_id_base: String
    let asset_id_quote: String
    let rate: Float
}
