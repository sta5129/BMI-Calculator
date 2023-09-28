//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Samarah Anderson on 4/23/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit
//holding all properties and methods to calculate BMI, interpret the BMI, provide advice and provide the appropiate color
struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let bmi1DecimalPl = String(format: "%.1f", bmi?.value ?? 0.0)
        return bmi1DecimalPl
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    //data and data type coming from BMI model
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more fries", color:  UIColor {_ in return #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)})
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Healthy", color:  UIColor {_ in return #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)})       } else{
                bmi = BMI(value: bmiValue, advice: "Eat more healthy foods", color:  UIColor {_ in return #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)})
            }
    }
}
