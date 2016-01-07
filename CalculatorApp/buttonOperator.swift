//
//  ButtonNumeric.swift
//  CalculatorApp
//
//  Created by Steven Smith on 6/01/2016.
//  Copyright © 2016 Steven Smith. All rights reserved.
//

import Foundation
import UIKit

class ButtonOperator : UIButton {
    
    
    var myOperator:String?

    required init(coder aDecoder: NSCoder!) {
        
        super.init(coder: aDecoder)!
        
        self.backgroundColor        = UIColor.orangeColor()
        self.alpha                  = 1;
        self.layer.cornerRadius     = 30
        self.setTitleColor(UIColor.grayColor(), forState: .Normal)
        
    }

}
