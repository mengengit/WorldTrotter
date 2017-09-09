//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Mark Engen on 9/7/17.
//  Copyright © 2017 Mark Engen. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    //Creates an outlet to a UILabel called celsiusLabel which needs to have a connection between the View Controller and the label itslf (remember right-click-drag or option-dragging?)
    @IBOutlet var celsiusLabel: UILabel!
    var fahrenheitValue: Measurement<UnitTemperature>? {
        /* Property observer (i.e. chunk of code immediately after a declaration which is called whenever the property's value changes).  One exception is when it is being initialized.  This isn't called then
        */
        didSet {
            print("  Starting didSet property observer action...")
            updateCelsiusLabel()
            print("  exiting didSet property observer action")
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
        print("Starting @IBAction func fahrenheitFieldEditingChanged...")
        //celsiusLabel.text = textField.text //No text in text field makes it disappear and everything else move up
        //Make sure celsiusLabel has a value, or if not display ???
        //if let text = textField.text, !text.isEmpty {
        //    celsiusLabel.text = text
        //} else {
        //    celsiusLabel.text = "???"
        //}
        /* Page 80 */
        if let text = textField.text, let value = Double(text) {
            print("  fahrenheitValue about to change, when it does, its property observer will trigger.")
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
            print("  Fahrenheit now \(String(describing: fahrenheitValue))")
            
        } else {
            fahrenheitValue = nil
            print("  Fahrenheit reset to nil")
            
        }
        print("exiting @IBAction func fahrenheitFieldEditingChanged...")

    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        print("starting @IBAction func dismissKeyboard")
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        print("    Starting func updateCelsiusLabel()...")
        if let celsiusValue = celsiusValue {
            //Pre-Number-Formatter style
            //celsiusLabel.text = "\(celsiusValue.value)"
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
            print("      Celsius is now  \(String(describing: celsiusLabel.text))")
        } else {

            celsiusLabel.text = "???"
            print("      Celsius is now \(String(describing: celsiusLabel.text)).")
        }
        print("    exiting func updateCelsiusLabel()")
        
    }
    
    override func viewDidLoad() {
        print("Starting override func viewDidLoad")
        super.viewDidLoad()
        print("  Calling updateCelsiusLabel()")
        updateCelsiusLabel()
        print("exiting viewDidLoad")
    }
    
    //Instantiate a "Number formatter" via a Closure
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
/*
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        /* Why the hell can't I print(textField.text) without warnings??? */
        //print(textField.text)
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        //print("\(String(describing: textField.text))")
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            return false
        } else {
            return true
        }
    }
*/
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print()
        print("Starting func textField because text changed...")
        print("    Display was: \(String(describing: textField.text))")
        //print("    You typed: <\(string)> ", terminator: "")
        print("    You typed: <\(string)> ")
        
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789.")
        let replacementStringCharacterSet = CharacterSet(charactersIn: string)
        if !replacementStringCharacterSet.isSubset(of: allowedCharacterSet) {
            print("    Rejected (Invalid Character)")
            print("exiting func textField.")
            print("probably not going to take us to the IBAction...")
            print()
            return false  //First return exits function
        }
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil {
            print("    Rejected (Already has decimal point)")
            print("exiting func textField")
            print("probably not going to take us to the IBAction...")
            print()
            return false  //First return exits function
        } else {
            print("    Accepted")
            print("exiting func textField which takes us automatically to IBAction...")
            print()
            return true  //First return exits function
        }
    }
    

}


