//
//  Logic.swift
//  CalculatorApp
//
//  Created by Steven Smith on 7/01/2016.
//  Copyright © 2016 Steven Smith. All rights reserved.
//

import Foundation

class Logic{
    
    var operators : [String]
    var operands : [Double]
    
    
    required init()
    {
        
        self.operands = []
        self.operators = []
       
        
    }



    func calculateArithmetic(operandValue : Double, operatorValue : String) -> String
    {
        

        
        self.operands.append(operandValue)
        self.operators.append(operatorValue)
        
        var valueCalculated : NSNumber = operandValue
        
        print(self.operands)
        

        if (self.operators.count > 1)
        {
        
            if self.operators[self.operators.count - 2] == "+"
            {
                    valueCalculated = self.operands[self.operands.count-2] + self.operands[self.operands.count-1]
            }
            
            if self.operators[self.operators.count - 2] == "-"
            {
                valueCalculated = self.operands[self.operands.count-2] - self.operands[self.operands.count-1]
            }
            
            if self.operators[self.operators.count - 2] == "/"
            {
                if (self.operands[self.operands.count-1] == 0)
                {
                    print("Error dividing by zero is not allowed")
                    
                    return String("Error")
                }
                
                valueCalculated = self.operands[self.operands.count-2] / self.operands[self.operands.count-1]
            }
            
            if self.operators[self.operators.count - 2] == "*"
            {
                valueCalculated = self.operands[self.operands.count-2] * self.operands[self.operands.count-1]
            }
            
            self.operands[self.operands.count-1] = valueCalculated.doubleValue
            
            
            // Try to cast as Int, otherwise send back a double...
            
//            if (Int(valueCalculated.integerValue) != nil)
//            {
//                return String(valueCalculated.integerValue)
//            }
//            else
//            {
                return NSString(format: "%.2f", valueCalculated.doubleValue) as String
//            }
            
            
        
        }
        else
        {
            if (Int(operandValue) != nil)
            {
                return String(Int(operandValue))
            }
            else
            {
                return String(operandValue)
            }
        }
        
        
        
    }
    
    
}