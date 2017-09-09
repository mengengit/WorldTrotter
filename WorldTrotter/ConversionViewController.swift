//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Mark Engen on 9/7/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    //Creates an outlet to a UILabel called celsiusLabel which needs to have a connection between the View Controller and the label itslf (remember right-click-drag or option-dragging?)
    @IBOutlet var celsiusLabel: UILabel!
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        /* Property observer (i.e. chunk of code immediately after a declaration which is called whenever the property's value changes).  One exception is when it is being initialized.  This isn't called then
        */
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue:Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    @IBOutlet var textField: UITextField!
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        //celsiusLabel.text = textField.text //No text in text field makes it disappear and everything else move up
        //Make sure celsiusLabel has a value, or if not display ???
        //if let text = textField.text, !text.isEmpty {
        //    celsiusLabel.text = text
        //} else {
        //    celsiusLabel.text = "???"
        //}
        /* Page 80 */
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            //Pre-Number-Formatter style
            //celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateCelsiusLabel()
    }
    
    //Instantiate a "Number formatter" via a Closure
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
}
