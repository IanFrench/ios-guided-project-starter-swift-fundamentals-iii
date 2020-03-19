//
//  ViewController.swift
//  TurkeyCalculator
//
//  Created by Paul Solt on 6/3/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    
    @IBOutlet var turkeyWeightTextField: UITextField!
    @IBOutlet var cookTimeTextField: UITextField!
    @IBOutlet var metricButton: UIButton!
    
    // Actions
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        guard let turkeyWeightString = turkeyWeightTextField.text else { return }
        
        guard let turkeyWeight = Double(turkeyWeightString) else {
            print("Invalid Number")
            return
        }
        
        var durationinMinutes: Double
        
        if metricButton.isSelected {
        durationinMinutes = cooktimeInKilos(turkeyWeight)
        } else {
        durationinMinutes = cooktimeInPounds(turkeyWeight)
        }
        let durationinHours = durationinMinutes / 60
        cookTimeTextField.text = "\(durationinHours) hours"
        
        
        
    }
    
    @IBAction func metricButtonPressed(_ sender: Any) {
        
        guard let button = sender as? UIButton else
        { return }
        button.isSelected.toggle()
        
        
    }
    
    // Helper functions
    func cooktimeInPounds(_ weight: Double) -> Double {
        let durationinMinutes = weight * 15.0
        return durationinMinutes
    }
    func cooktimeInKilos (_ weight: Double) -> Double {
        var durationinMinutes: Double
        
        if weight >= 4 {
            durationinMinutes = 20 * weight + 90
        } else {
            durationinMinutes = 20 * weight + 70
        }
        return durationinMinutes
    }
    
}
