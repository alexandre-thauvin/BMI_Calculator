//
//  BMIhandler.swift
//  myBMI
//
//  Created by Alexandre on 22/11/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import Foundation
import UIKit

struct BMIhandler {
    
    let userWeight: Double
    let userHeight: Double
    
    init(userWeight: String, userHeight: String) {
        
        self.userWeight = Double(userWeight) ?? 0.0
        self.userHeight = Double(userHeight) ?? 0.0
        
    }
        
    func whatIsMyBMI() -> Double {
        
        return userWeight / ((userHeight / 100) * (userHeight / 100))
        
    }
}
