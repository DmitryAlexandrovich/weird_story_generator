//
//  ViewController.swift
//  weird_story_generator
//
//  Created by Python_data_processing on 22/03/2017.
//  Copyright © 2017 Python_data_processing. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    var textFields: [UITextField]!
    
    @IBOutlet weak var pastTenseVerb: UITextField!
    
    @IBOutlet weak var singularNoun: UITextField!
    
    @IBOutlet weak var PluralNoun: UITextField!
    
    @IBOutlet weak var phrase: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    @IBOutlet weak var resultsTextView: UITextView!
    
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = 15
        
        textFields = [pastTenseVerb, singularNoun, PluralNoun, phrase]
        
        sliderLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func buttonPressed(_ sender: Any) {
        
        var placeString = ""
        
        if segmentControl.selectedSegmentIndex == 0 {
        placeString = "Library"
        } else if segmentControl.selectedSegmentIndex == 1 {
        placeString = "Theatre"
        } else {
        placeString = "Shopping mall"
        }
        
        resultsTextView.text = "One day, at the \(placeString) \(singularNoun.text!) \(pastTenseVerb.text!) \(sliderLabel.text!) \(PluralNoun.text!) and said, \(phrase.text!)"
        
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        sliderLabel.text = "\(Int(slider.value))"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textFieldArray = textFields as NSArray
        let index = textFieldArray.index(of: textField)
        
        if index < textFieldArray.count - 1 {
        let newTextField = textFieldArray[index+1] as! UITextField
            newTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}

