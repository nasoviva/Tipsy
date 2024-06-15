//
//  Calculator.swift
//  Tipsy
//
//  Created by Victoria on 14/06/2024.
//

import Foundation

struct Calculator {
    
    var tip: Double
    var numberOfPeople: Int
    var billTotal: Double
    var finalResult: String

    init() {
        tip = 0.0
        numberOfPeople = 2
        billTotal = 0.0
        finalResult = "0.0"
    }
}
