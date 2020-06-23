//
//  CalculateBMI.swift
//  BMI Calculator
//
//  Created by Hector Takami on 02/06/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct CalculateBMI {
    
    var bmi: BMI?
    
    mutating func calculateBMI(_ height:Float, _ weight:Float){
        let bmiValue = weight / (height * height)
        if bmiValue >= 24.9 {
            bmi = BMI(value: bmiValue, advice: "It's time to stop eating snacks!", color: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1))
        }else if bmiValue < 24.9 && bmiValue >= 18.5 {
            bmi = BMI(value: bmiValue, advice: "Fit! Keep it like this, baby!", color: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1))
        }else{
            bmi = BMI(value: bmiValue, advice: "You have to eat more!", color: #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1))
        }
    }
    
    func getBMI()->String{
        return String(format: "%.1f", bmi?.value ?? "0.0")
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
}
