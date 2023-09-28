//
//  ResultsViewController.swift
//  BMI Calculator
//
//  Created by Samarah Anderson on 4/23/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit
// UIVC super class that we are inheriting from
class ResultsViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
//additional setup code for the view that is not related to its layout, such as initializing variables, configuring delegates, or performing any other tasks that need to be done before the view is displayed.
        
        //bmiValue, advice and color data coming from CalculatorBrain
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    
    }
    //functionality for changing back to CalculatevC once button is pressed
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil) //dismisses the current view controller
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
