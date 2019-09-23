//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by IOS User1 on 17/09/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation
struct CalculatorLogic {
    private var number : Double?
    private var intermediateCalculation : (n1 : Double , calcMethod : String)?
    mutating func setNumber(_ number : Double){
        self.number = number
    }
    mutating func calculate(symbol : String) -> Double?{
        if let n = number{
            if symbol == "+/-"
            {
                return n * -1
            }
            else if symbol == "%"
            {
                return n * 0.01
            }
            else if symbol == "AC"
            {
                return 0
            }
            else if symbol == "="
            {
                return performTwoNum(n2: n)
            }
            else
            {
                intermediateCalculation = (n1 : n , calcMethod : symbol)
               
               
            }
        }
        return nil
    }
    private func performTwoNum(n2 num2 : Double) -> Double?
    {
       
        if let num1 = intermediateCalculation?.n1 , let operation = intermediateCalculation?.calcMethod
        {
            switch operation
            {
            case "+" :
                return num1 + num2
            case "-" :
                return num1 - num2
            case "×" :
                return num1 * num2
            case "÷" :
                return num1 / num2
                
                
            default:
                print("default")
            }
        }
        return nil
    }
}
