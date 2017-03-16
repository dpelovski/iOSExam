//
//  AllAnswersTableViewController.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit

class AllAnswersTableViewController: UITableViewController {
    
    var allAnswers = [String: Any?]()
    var answersArr = [[String:Any?]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DBRequester.instance.getAllAnswers()
        
        
        NotificationCenter.default.addObserver(forName: .DataReloaded, object: nil, queue: nil) { (notification) in
            
            let dictFromDb = DBRequester.instance.allAnswers
            
            self.allAnswers = dictFromDb
            
            for (key,_) in dictFromDb {
                self.answersArr.append(dictFromDb[key] as! [String : Any?])
            }
            
            self.tableView.reloadData()
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allAnswers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCellIdentifier", for: indexPath)
        
        //data[indexPath.row]
        let firstName = answersArr[indexPath.row]["firstName"] as! String
        let lastName = answersArr[indexPath.row]["lastName"] as! String

        cell.textLabel?.text = firstName + " " + lastName
        
        let DBtime = answersArr[indexPath.row]["time"] as! String
       
        cell.detailTextLabel?.text = DBtime
        
        return cell
    }

    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        
        UserDefaults.standard.set(nil, forKey: "autoLogin")
        
        self.modalTransitionStyle = .flipHorizontal
        
        self.present(UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController()!, animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentlySelectedCell = self.answersArr[indexPath.row]
        
        self.performSegue(withIdentifier: "ShowDetail", sender: currentlySelectedCell)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetail" {
            (segue.destination as! AnswerDetailTableViewController).userInfo = (sender as? [String : Any?])!
        }
        
        
    }
    
    
}
