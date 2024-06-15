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

    var calculatorBrain = CalculatorBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = calculatorBrain.getResult()
        settingLabel.text = calculatorBrain.getSettingLabelText()
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToBack", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBack" {
            calculatorBrain.getDestinationAsCalculatorVC(segue)
        }
    }
}
