//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var zButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twenButton: UIButton!
    @IBOutlet weak var splitNumber: UILabel!
    
    var tipValue = 0.1
    var bill = 0.0
    var nPeople = 2.0
    var resultStr = "0.0"
    
    @IBAction func tipChange(_ sender: UIButton) {
        
        billText.endEditing(true)
        
        zButton.isSelected = false
        tenButton.isSelected = false
        twenButton.isSelected = false
        
        sender.isSelected = true
        
        switch String(sender.currentTitle!) {
        case "10%":
            tipValue = 0.1
        case "20%":
            tipValue = 0.2
        default:
            tipValue = 0
        }
        
    }
    
    @IBAction func splitNumberChanged(_ sender: UIStepper) {
        
        splitNumber.text = Int(sender.value).description
        nPeople = Double(sender.value)
        
    }
    
    @IBAction func calculatePressed(_ sender: Any) {
        
        let billStr = billText.text!
        
        if billStr != ""{
            bill = Double(billStr)!
            let calculationResult = (bill*(1+tipValue))/nPeople
            resultStr = String(format: "%.2f", calculationResult)
            print(resultStr)
            
            
        }
        self.performSegue(withIdentifier: "proceedToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proceedToResult"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = resultStr
            destinationVC.tip = Int(tipValue * 100)
            destinationVC.split = Int(nPeople)
        }
    }
    
}

