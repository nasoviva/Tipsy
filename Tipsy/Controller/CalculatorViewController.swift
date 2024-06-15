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

    var calculatorBrain = CalculatorBrain()

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        calculatorBrain.selectPercent(sender.tag)
    }

    @IBAction func stepperChanged(_ sender: UIStepper) {
        splitNumber.text = calculatorBrain.selectSplitNumber(sender)
        calculatorBrain.getNumberOfPeorle(sender)
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.getBillTotal(billTextField.text ?? "0.0")
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
           calculatorBrain.getDestinationAsResultVC(segue)
        }
    }
}

