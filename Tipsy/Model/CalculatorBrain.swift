//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Victoria on 14/06/2024.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var calc = Calculator()
    var result = Result()

    mutating func selectPercent(_ tag: Int) {
        if tag == 10 {
            calc.tip = 0.1
        } else if tag == 20 {
            calc.tip = 0.2
        }
    }

    func selectSplitNumber(_ sender: UIStepper) -> String {
        return String(format:"%.0f",sender.value)
    }

    mutating func getNumberOfPeorle(_ sender: UIStepper) {
        calc.numberOfPeople = Int(sender.value)
    }

    mutating func getBillTotal(_ bill: String) {
        calc.billTotal = Double(bill) ?? 0.0
        if calc.billTotal > 0 && calc.billTotal < 999999999999999 {
            let result = (calc.billTotal + calc.billTotal * calc.tip) / Double(calc.numberOfPeople)
            calc.finalResult = String(format: "%.2f", result)
        }
    }

    func getResult() -> String {
        return result.billForOne
    }

    func getSettingLabelText() -> String {
        "Split \(result.billTotal) between \(result.splitFor) people, with \(result.tip)% tip."
    }

    func getDestinationAsResultVC(_ segue: UIStoryboardSegue) {
        let destinationVC = segue.destination as! Result_View_ControllerViewController
        destinationVC.calculatorBrain.result.billForOne = calc.finalResult
        destinationVC.calculatorBrain.result.tip = Int(calc.tip * 100)
        destinationVC.calculatorBrain.result.splitFor = calc.numberOfPeople
        destinationVC.calculatorBrain.result.billTotal = calc.billTotal
    }

    func getDestinationAsCalculatorVC(_ segue: UIStoryboardSegue) {
        let destinationVC = segue.destination as! CalculatorViewController
        destinationVC.calculatorBrain.calc.tip = 0.0
        destinationVC.calculatorBrain.calc.numberOfPeople = 2
        destinationVC.calculatorBrain.calc.billTotal = 0.0
    }
}


