//
//  MaleInformationViewController.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit

class MaleInformationViewController: UIViewController {
    
    @IBOutlet weak var daysSpentHomeworkSlider: UISlider!
    
    @IBOutlet weak var songsField: UITextField!
    
    
    @IBOutlet weak var doLikeShopska: UISwitch!
    
    @IBOutlet weak var equationAnswer: UITextField!
    @IBOutlet weak var favouriteDrink: UITextField!
    
    var personData = [String:Any?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func submitAnswerPressedMale(_ sender: UIButton) {
        
        guard songsField.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Songs cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard equationAnswer.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Equation answer cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard favouriteDrink.text!.characters.count > 1 else {
            let alert = UIAlertController.init(title: "Error", message: "Favourite drink cannot be less then 2 characters", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        personData["daysSpentHomework"] = daysSpentHomeworkSlider.value
        personData["songs"] = songsField.text
        personData["shopska"] = String(describing: doLikeShopska.isOn)
        personData["equationAnswer"] = equationAnswer.text
        personData["favouriteDrink"] = favouriteDrink.text
        
        
        let currentDate = Date()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        personData["time"] = formatter.string(from: currentDate)
        
        DBRequester.instance.createAnswer(data: self.personData)
        
        _ = self.navigationController?.popToRootViewController(animated: true)
        
    }

}
