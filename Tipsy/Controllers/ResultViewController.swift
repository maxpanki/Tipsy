//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Maksim Pansevich on 25/04/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var result = "0.0"
    var tip = 10
    var split = 2

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var informationLabel: UILabel!
    
    @IBAction func recalculateButtonPressed(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = result
        informationLabel.text = "Split between \(split) people, with \(tip)% tip"
    }
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
