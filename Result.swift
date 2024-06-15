//
//  Result.swift
//  Tipsy
//
//  Created by Victoria on 14/06/2024.
//

import Foundation

struct Result {

    var billForOne: String
    var tip: Int
    var splitFor: Int
    var billTotal: Double

    init() {
        billForOne = "0.0"
        tip = 0
        splitFor = 2
        billTotal = 0.0
    }
}
