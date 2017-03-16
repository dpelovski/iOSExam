//
//  FemaleInformationViewController.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit

class FemaleInformationViewController: UIViewController {
    
    @IBOutlet weak var lipstickSlider: UISlider!
    
    @IBOutlet weak var typeOfSkinTextField: UITextField!
    
    @IBOutlet weak var sensitiveSunSwitch: UISwitch!
    
    @IBOutlet weak var kindOfMakeup: UITextField!
    
    @IBOutlet weak var favouriteBrand: UITextField!
    
    @IBOutlet weak var currentBackground: backgroundChanger!
    
    
    var personData = [String:Any?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitPressedFemale(_ sender: UIButton) {
        
        guard typeOfSkinTextField.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Type of skin cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard kindOfMakeup.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Kind of makeup cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard favouriteBrand.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Favourite brand cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        personData["lipstick"] = lipstickSlider.value
        personData["typeOfSkin"] = typeOfSkinTextField.text
        personData["sensitiveToSun"] = String(describing: sensitiveSunSwitch.isOn)
        personData["kindOfMakeup"] = kindOfMakeup.text
        personData["favouriteBrand"] = favouriteBrand.text
        
        let currentDate = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        personData["time"] = formatter.string(from: currentDate)
        
        DBRequester.instance.createAnswer(data: self.personData)
        
        _ = self.navigationController?.popToRootViewController(animated: true)
        
    }
    @IBAction func changeBackgroundPressed(_ sender: UIButton) {
        self.currentBackground.changeBackground(UIColor.purple)
    }
}
