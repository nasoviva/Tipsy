//
//  Result View ControllerViewController.swift
//  Tipsy
//
//  Created by Victoria on 12/06/2024.
//

import UIKit

class Result_View_ControllerViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!

    var result = "0.0"
    var tip = 0
    var split = 2
    var billTotal = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = result
        settingLabel.text = "Split \(billTotal) between \(split) people, with \(tip)% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBack", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBack" {
            let destinationVC = segue.destination as! CalculatorViewController
            destinationVC.tip = 0.0
            destinationVC.numberOfPeople = 2
            destinationVC.billTotal = 0.0
        }
    }
}
