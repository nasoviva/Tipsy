//
//  CalculatorViewController.swift
//  Tipsy
//
//  Created by Victoria on 12/06/2024.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercent: UIButton!
    @IBOutlet weak var tenPercent: UIButton!
    @IBOutlet weak var twentyPercent: UIButton!
    @IBOutlet weak var splitNumber: UILabel!

    var tip = 0.0
    var numberOfPeople = 2
    var billTotal = 0.0
    var finalResult = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender == tenPercent {
            tenPercent.isSelected = true
            tip = 0.1
        } else if sender == twentyPercent {
            twentyPercent.isSelected = true
            tip = 0.2
        }
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumber.text = String(format:"%.0f",sender.value)
        numberOfPeople = Int(sender.value)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text ?? "0.0"
        if bill != "" {
            billTotal = Double(bill) ?? 0.0
            if billTotal > 0 && billTotal < 999999999999999 {
                let result = (billTotal + billTotal * tip) / Double(numberOfPeople)
                finalResult = String(format: "%.2f", result)
            }
        }
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! Result_View_ControllerViewController
            destinationVC.result = finalResult
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numberOfPeople
            destinationVC.billTotal = billTotal
        }
    }
}

