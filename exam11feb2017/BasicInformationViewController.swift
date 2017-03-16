//
//  BasicInformationViewController.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit
import Font_Awesome_Swift

class BasicInformationViewController: UIViewController {
    
    @IBOutlet weak var femaleLabel: UILabel!
    @IBOutlet weak var maleLabel: UILabel!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var genderSwitch: UISwitch!
    
    @IBOutlet weak var ageTextField: UITextField!
    
    @IBOutlet weak var addressTextField: UITextField!
    
    var personData = [String:Any?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.maleLabel.setFAIcon(icon: .FAMale, iconSize: 35)
        self.femaleLabel.setFAIcon(icon: .FAFemale, iconSize: 35)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard firstNameTextField.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "First name cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard lastNameTextField.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Last name cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        
        if ageTextField.text!.isNumber != true {
            let alert = UIAlertController.init(title: "Error", message: "Age must be a valid integer", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard addressTextField.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Address cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        personData["firstName"] = firstNameTextField.text!
        personData["lastName"] = lastNameTextField.text!
        
        
        var gender = "female"
        
        if genderSwitch.isOn == false {
            gender = "male"
        }
        
        personData["gender"] = gender
        personData["age"] = ageTextField.text!
        personData["address"] = addressTextField.text!
        
        if genderSwitch.isOn == false {
            if segue.identifier == "ToMaleController" {
                
                (segue.destination as! MaleInformationViewController).personData = self.personData
            }
        }
        else {
            if segue.identifier == "ToFemaleController" {
                
                (segue.destination as! FemaleInformationViewController).personData = self.personData
            }
        }

        
    }
    
    
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if genderSwitch.isOn == false {
            performSegue(withIdentifier: "ToMaleController", sender: self.personData)
        }
        else {
            performSegue(withIdentifier: "ToFemaleController", sender: self.personData)
       
        }
        
    }
    

}
