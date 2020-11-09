//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPrcButton: UIButton!
    @IBOutlet weak var tenPrcButton: UIButton!
    @IBOutlet weak var twentyPrcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var percentage: Float = 0.0
    var billSum: Float = 0.0
    var splittedSum: Float = 0.0
    var numberOfGuests: Float = 0.0
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.currentTitle == "0%" {
            zeroPrcButton.isSelected = true
            tenPrcButton.isSelected = false
            twentyPrcButton.isSelected = false
            percentage = 0.0
        } else if sender.currentTitle == "10%" {
            zeroPrcButton.isSelected = false
            tenPrcButton.isSelected = true
            twentyPrcButton.isSelected = false
            percentage = 0.1
        } else if sender.currentTitle == "20%" {
            zeroPrcButton.isSelected = false
            tenPrcButton.isSelected = false
            twentyPrcButton.isSelected = true
            percentage = 0.2
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        
        let text = billTextField.text!
        if text != "" {
            billSum = Float(text)!
        }
      
        numberOfGuests = Float(splitNumberLabel.text!)!
        
        splittedSum = (billSum + (billSum * percentage)) / numberOfGuests
        print(splittedSum)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.splittedBillValue = splittedSum
            destinationVC.prc = percentage
            destinationVC.guestsNumber = numberOfGuests
        }
    }
    
    
}

