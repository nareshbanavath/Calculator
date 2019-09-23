//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var isFinishedTypingNumber : Bool = true
    private var displayValue : Double
    {
        get{
             guard let number = Double(displayLabel.text!)else{fatalError("can not convert to double")}
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    @IBOutlet weak var displayLabel: UILabel!
    
    private var calculate = CalculatorLogic()
    override func viewDidLoad() {
        let dateString = "Thu, 22 Oct 2015 07:45:17 +0000"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE, dd MMM yyyy hh:mm:ss +zzzz"
        dateFormatter.locale = Locale.init(identifier: "en_GB")
        
        let dateObj = dateFormatter.date(from: dateString)
        
        dateFormatter.dateFormat = "MM-dd-yyyy"
        print("Dateobj: \(dateFormatter.string(from: dateObj!))")
   
       
    }
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        calculate.setNumber(displayValue)
        if let calMethod = sender.currentTitle
        {
            if let dispVal = calculate.calculate(symbol: calMethod) {
            displayValue = dispVal
            }
        }
       

    }

    //cmd+alt(option)+left arrow to fold the block of code
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
       
        //What should happen when a number is entered into the keypad
        if let newValue = sender.currentTitle
        {
            if isFinishedTypingNumber
            {
                displayLabel.text = newValue
                isFinishedTypingNumber = false
                
            }
            else{
                
                if newValue.contains(".")
                {
//                    let isInt = floor(displayValue) == displayValue//allow '.' only when we have Int in display Label here ceil or floor can be used it just for reference when lhs = rhs it is int so we can allow .
//                    if !isInt
//                    {
//                        return //if not int return
                    
//                    }
                    if displayLabel.text!.contains("."){
                        return
                    }
                    else{
                        
                    }
                    
                }
           
                displayLabel.text = displayLabel.text! + newValue
                
            }
        }
    
    }

}

