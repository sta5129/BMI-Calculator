//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Samarah Anderson on 4/23/23.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
// UIVC super class that we are inheriting from
class CalculateViewController: UIViewController {
    
    //IBOutlets are just referring to the UI element on the storyboard, while IBAction is a function tied to said element and updates the view accordingly. IBOutlets are comparable to instance variables that you can update. IBActions take in the result of the event and change the corresponding storyboard in some fashion.
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
   
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //functionality for how the data changes when user changes slider
    @IBAction func heightSliderChanged(_ sender: UISlider) {
        //
        let height = String(format: "%.2f", sender.value ) // making it so that only two decimal places show
        heightLabel.text = "\(height)m" //making it so that when the slider is used the units stay as the number is changed
    }
    //functionality for how the data changes when user changes slider
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let weight = String(format: "%.0f", sender.value)
        //'%.0f' making it so that only one decimal place shows
        weightLabel.text = "\(weight)Kg"
    }
        //functionality for changing to the resultsVC once button is pressed
    @IBAction func calculatePressed(_ sender: UIButton) {
        //constant pulling the value of the height and weight user inputs
        let height = heightSlider.value
        let weight = weightSlider.value
        calculatorBrain.calculateBMI(height: height, weight: weight)
        //switching from the calculateVC to resultsVC so that user can see the result of the calculation performed in CalculatorBrain
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    /*if there are multiple segues first use an if statement to check if the segue.identifier is equal to the other segue identifiers         if segue.identifier == "goToResult" { let destinationVC = segue.destination as! ResultViewController       destination.bmiValue = "0.0"}
     segue initialize a box standard UIViewCtontroller. We have to narrow down the data type and specify the exact data type the destination will be
     as! downcasting: UIViewController(superClass) can be casted down to the ResultViewController. ! means it's forced
    */
    //preparation for the VC to switch
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
}

