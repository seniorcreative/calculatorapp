//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Steven Smith on 6/01/2016.
//  Copyright © 2016 Steven Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // Output label where we will store current value
    @IBOutlet weak var outputLabel: UITextField!
    
    @IBOutlet weak var buttonNumeric1: ButtonNumeric!
    @IBOutlet weak var buttonNumeric2: ButtonNumeric!
    @IBOutlet weak var buttonNumeric3: ButtonNumeric!
    @IBOutlet weak var buttonNumeric4: ButtonNumeric!
    @IBOutlet weak var buttonNumeric5: ButtonNumeric!
    @IBOutlet weak var buttonNumeric6: ButtonNumeric!
    @IBOutlet weak var buttonNumeric7: ButtonNumeric!
    @IBOutlet weak var buttonNumeric8: ButtonNumeric!
    @IBOutlet weak var buttonNumeric9: ButtonNumeric!
    @IBOutlet weak var buttonNumeric0: ButtonNumeric!
    @IBOutlet weak var buttonNumericPoint: ButtonNumeric!
    
    @IBOutlet weak var buttonFunctionAllClear: ButtonFunction!
    @IBOutlet weak var buttonFunctionClear: ButtonFunction!
    @IBOutlet weak var buttonFunctionPolarity: ButtonFunction!
    @IBOutlet weak var buttonFunctionPerc: ButtonFunction!
    
    @IBOutlet weak var buttonOperatorPlus: ButtonOperator!
    @IBOutlet weak var buttonOperatorMinus: ButtonOperator!
    @IBOutlet weak var buttonOperatorDivide: ButtonOperator!
    @IBOutlet weak var buttonOperatorMultiply: ButtonOperator!
    @IBOutlet weak var buttonOperatorEquals: ButtonOperator!
    
    
    
    var logic : Logic = Logic()
    
    var boolNewOperand:Bool = true
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    
        
        outputLabel.text = "Hello" // String(Double(0))
        outputLabel.backgroundColor     = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        outputLabel.layer.cornerRadius  = 10
        
        prepareNumericButtons()
        prepareFunctionButtons()
        prepareOperatorButtons()
        
        
        // Fade the output in
        outputLabel.alpha = 0;
        UIView.animateWithDuration(2, delay: 1.5, options: UIViewAnimationOptions.CurveEaseOut, animations:{
            self.outputLabel.alpha = 1
            }, completion: nil)

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //
    
    func prepareNumericButtons()
    {
        
        let numberButtons : [ButtonNumeric] = [
            buttonNumeric1,
            buttonNumeric2,
            buttonNumeric3,
            buttonNumeric4,
            buttonNumeric5,
            buttonNumeric6,
            buttonNumeric7,
            buttonNumeric8,
            buttonNumeric9,
            buttonNumericPoint,
            buttonNumeric0
        ]
        
        for var b = 0; b < numberButtons.count; b++
        {
            
            numberButtons[b].value = numberButtons[b].currentTitle
            
            
            let delayAmount : Double = Double(b) * 0.1
            
            UIView.animateWithDuration(0.2, delay: delayAmount, options: UIViewAnimationOptions.CurveEaseOut, animations:{
                numberButtons[b].alpha = 1
                }, completion: nil)
            
        }
        
    }
    
    func prepareFunctionButtons()
    {
        
        
        let functionButtons : [String: ButtonFunction] = [
            "AC"    : buttonFunctionAllClear,
            "C"     : buttonFunctionClear,
            "+/-"   : buttonFunctionPolarity,
            "%"     : buttonFunctionPerc
        ]
        
        for (symbol, button) in functionButtons
        {
            button.setTitle(symbol, forState: .Normal)
            button.myFunctionRef = symbol
        }
        
    }
    
    func prepareOperatorButtons()
    {
        
    
        let operatorButtons : [String: ButtonOperator] = [
            "+" : buttonOperatorPlus,
            "-" : buttonOperatorMinus,
            "/" : buttonOperatorDivide,
            "*" : buttonOperatorMultiply,
            "=" :buttonOperatorEquals
        ]
        
        buttonOperatorEquals.backgroundColor = UIColor.blackColor()
        
        var buttonNumber = 0
        
        for (symbol, button) in operatorButtons
        {
//            button.setTitle(symbol, forState: .Normal)
            button.myOperator = symbol
            
            buttonNumber++
        }
      
        
    }
    
    @IBAction func btnNumericAction(sender: AnyObject) {
        
        let clickedButton = sender as! ButtonNumeric
        let stringValue = String(clickedButton.value!)
        
        if (boolNewOperand)
        {
            outputLabel.text = ""
            boolNewOperand = false
        }
        
        if (self.outputLabel.text == "0")
        {
            outputLabel.text = ""
        }
        
        outputLabel.text = outputLabel.text! + stringValue
    
    }
    
    @IBAction func btnOperatorAction(sender: AnyObject) {
        
        let clickedButton = sender as! ButtonOperator
        if clickedButton.myOperator != nil
        {
 
            let operatorValue = clickedButton.myOperator!
            boolNewOperand = true
            
            outputLabel.text = self.logic.calculateArithmetic(Double(outputLabel.text!)!, operatorValue: operatorValue)
            

        }
        
    }
    
    @IBAction func btnFunctionAction(sender: AnyObject) {
        

        let clickedButton = sender as! ButtonFunction
        
        // All clear function
        if (clickedButton.myFunctionRef == "AC")
        {
            self.outputLabel.text = "0"
            self.logic.operands = []
            self.logic.operators = []
        }
        
        // Clear function
        if (clickedButton.myFunctionRef == "C")
        {
            self.outputLabel.text = "0"
        }
        
        // Percentage function
        if (clickedButton.myFunctionRef == "%" && Int(self.outputLabel.text!) != 0)
        {
            self.outputLabel.text = NSString(format: "%.2f", Double(self.outputLabel.text!)! / 100) as String
        }
        
        // Reverse polarity flip
        if (clickedButton.myFunctionRef == "+/-" && Int(self.outputLabel.text!) != 0)
        {
            self.outputLabel.text = NSString(format: "%.2f", Double(self.outputLabel.text!)! * -1) as String
        }
        
    }

}

