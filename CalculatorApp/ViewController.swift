//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Steven Smith on 6/01/2016.
//  Copyright © 2016 Steven Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UITextField!
    
    @IBOutlet weak var buttonNumeric1: ButtonNumeric!
    @IBOutlet weak var buttonNumeric2: ButtonNumeric!
    
    @IBOutlet weak var buttonFunctionClear: ButtonFunction!
    
    @IBOutlet weak var buttonOperatorPlus: ButtonOperator!
    @IBOutlet weak var buttonOperatorEquals: ButtonOperator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
//        for family: String in UIFont.familyNames()
//        {
//            print("\(family)")
//            for names: String in UIFont.fontNamesForFamilyName(family)
//            {
//                print("== \(names)")
//            }
//        }
        
        

        outputLabel.backgroundColor     = UIColor(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
        outputLabel.layer.cornerRadius  = 10
        
        prepareNumericButtons()
        prepareFunctionButtons()
        prepareOperatorButtons()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    //
    
    func prepareNumericButtons()
    {
        
        let buttons = [buttonNumeric1, buttonNumeric2]
        
        var buttonNumber = 1
        
        for button in buttons
        {
            button.alpha = 1;
            button.backgroundColor = UIColor.whiteColor()
            button.layer.cornerRadius = 30
            button.setTitle(String(buttonNumber), forState: .Normal)
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            button.value = buttonNumber
                
            buttonNumber++
        }
        
    }
    
    func prepareFunctionButtons()
    {
        
        buttonFunctionClear.alpha = 1;
        buttonFunctionClear.backgroundColor = UIColor.grayColor()
        buttonFunctionClear.layer.cornerRadius = 30
        buttonFunctionClear.setTitle("C", forState: .Normal)
        buttonFunctionClear.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        buttonFunctionClear.myFunction = "C"
        
    }
    
    func prepareOperatorButtons()
    {
        
        var operatorButtons = [buttonOperatorPlus,buttonOperatorEquals]
        
        var operators = ["+", "="] // "-", "/", "x"]
        
        
        
        var buttonNumber = 0
        
        for button in operatorButtons
        {
            button.alpha = 1;
            button.backgroundColor = UIColor.orangeColor()
            button.layer.cornerRadius = 30
            button.setTitle(operators[buttonNumber], forState: .Normal)
            button.setTitleColor(UIColor.grayColor(), forState: .Normal)
            button.myOperator = operators[buttonNumber]
            
            buttonNumber++
        }
      
        
    }
    
    @IBAction func btnNumericAction(sender: AnyObject) {
        
        let clickedButton = sender as! ButtonNumeric
        let stringValue = String(clickedButton.value!)
        outputLabel.text = outputLabel.text! + stringValue
    
    }
    
    @IBAction func btnOperatorAction(sender: AnyObject) {
        
        let clickedButton = sender as! ButtonOperator
        let stringValue = clickedButton.myOperator!
    
        print("Operator \(stringValue)")
//        outputLabel.text = outputLabel.text! + stringValue
        
    }
    
    @IBAction func btnFunctionAction(sender: AnyObject) {
        
        print("Clearing")
        let clickedButton = sender as! ButtonFunction
        
        // Clear function
        if (clickedButton.myFunction == "C")
        {
            self.outputLabel.text = ""
        }
        
    }

}

