//
//  ApplicationContainer.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit

class ApplicationContainer: UIViewController {
    
    var loggedInState = false

    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let logged = UserDefaults.standard.object(forKey: "autoLogin") as? Bool {
            self.loggedInState = logged
        }
        else {
            self.loggedInState = false
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if self.loggedInState == true {
            performSegue(withIdentifier: "ToMainApp", sender: nil)
        }
        else {
            performSegue(withIdentifier: "ToLoginScreen", sender: nil)
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
