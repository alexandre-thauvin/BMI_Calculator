//
//  MainController.swift
//  myBMI
//
//  Created by Alexandre on 22/11/2018.
//  Copyright © 2018 Alexandre. All rights reserved.
//

import UIKit

class MainController: UIViewController {
    
    // TextFields
    @IBOutlet weak var myHeight: UITextField!
    @IBOutlet weak var myWeight: UITextField!
    
    // Labels
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var BMI: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Alert handler
    func errorHandler() {
        let alertController = UIAlertController(title: "Error !", message: "Please correctly fill the fields with numeric values only and not equal to 0.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    }
    
    // Calcul handler
    @IBAction func calculBMI(_ sender: UIButton) {
        
        guard let weightInKG = myWeight.text else { return }
        guard let heightInCM = myHeight.text else { return }
        
        // Error handling
        guard let checker1 = myWeight.text, !checker1.isEmpty else {
            errorHandler()
            return
        }
        
        guard let checker2 = myHeight.text, !checker2.isEmpty else {
            errorHandler()
            return
        }
        
        let characterset = CharacterSet(charactersIn: ".0123456789")
        
        if myHeight.text!.rangeOfCharacter(from: characterset.inverted) != nil {
            errorHandler()
            return
        }
        
        if myWeight.text!.rangeOfCharacter(from: characterset.inverted) != nil {
            errorHandler()
            return
        }
        
        if let n = NumberFormatter().number(from: myWeight.text!) {
            let f = CGFloat(truncating: n)
            if f == 0 {
                errorHandler()
                return
            }
        }
        
        if let n = NumberFormatter().number(from: myHeight.text!) {
            let f = CGFloat(truncating: n)
            if f == 0 {
                errorHandler()
                return
            }
        }
        
        let cm = BMIhandler(userWeight: weightInKG, userHeight: heightInCM)
        let total = Double(round(100*cm.whatIsMyBMI())/100)
        
        if (total <= 18.4) {
            result.text = "BMI: \(total)"
            BMI.text = "Under Weight"
        } else if (total > 18.4 && total <= 25) {
            result.text = "BMI: \(total)"
            BMI.text = "Normal Weight"
        } else if (total > 25 && total <= 30) {
            result.text = "BMI: \(total)"
            BMI.text = "Over Weight"
        } else if (total > 30) {
            result.text = "BMI: \(total)"
            BMI.text = "Obese"
        }
        
    }

}

