//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Anton Budkevich on 10/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var splittedBillValue: Float = 0.0
    var guestsNumber: Float = 0.0
    var prc: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", splittedBillValue)
        settingsLabel.text = "Split between \(Int(guestsNumber)) people, with \(Int(prc * 100)) % tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
