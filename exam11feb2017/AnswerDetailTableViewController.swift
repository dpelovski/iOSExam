//
//  AnswerDetailTableViewController.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit

class AnswerDetailTableViewController: UITableViewController {
    
    var userInfo = [String:Any?]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(userInfo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.userInfo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoIdentifier", for: indexPath)
        
        
        if self.userInfo["gender"] as! String == "male" {
            
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "First Name"
                cell.detailTextLabel?.text = self.userInfo["firstName"] as? String
            case 1:
                cell.textLabel?.text = "Last Name"
                cell.detailTextLabel?.text = self.userInfo["lastName"] as? String
            case 2:
                cell.textLabel?.text = "Gender"
                cell.detailTextLabel?.text = self.userInfo["gender"] as? String
            case 3:
                cell.textLabel?.text = "Age"
                cell.detailTextLabel?.text = self.userInfo["age"] as? String
            case 4:
                cell.textLabel?.text = "Time spent on homework"
                cell.detailTextLabel?.text = String(describing: self.userInfo["daysSpentHomework"] as! Int)
            case 5:
                cell.textLabel?.text = "Pop folk preference"
                cell.detailTextLabel?.text = self.userInfo["songs"] as? String
            case 6:
                cell.textLabel?.text = "Shopska?"
                cell.detailTextLabel?.text = self.userInfo["shopska"] as? String
            case 7:
                cell.textLabel?.text = "Answer equation"
                cell.detailTextLabel?.text = self.userInfo["equationAnswer"] as? String
            case 8:
                cell.textLabel?.text = "Favourite drink"
                cell.detailTextLabel?.text = self.userInfo["favouriteDrink"] as? String
            
                
            default:
                break
            }

            
        }
        else {
            switch indexPath.row {
            case 0:
                cell.textLabel?.text = "First Name"
                cell.detailTextLabel?.text = self.userInfo["firstName"] as? String
            case 1:
                cell.textLabel?.text = "Last Name"
                cell.detailTextLabel?.text = self.userInfo["lastName"] as? String
            case 2:
                cell.textLabel?.text = "Gender"
                cell.detailTextLabel?.text = self.userInfo["gender"] as? String
            case 3:
                cell.textLabel?.text = "Age"
                cell.detailTextLabel?.text = self.userInfo["age"] as? String
            case 4:
                cell.textLabel?.text = "Use lipstick"
                cell.detailTextLabel?.text = String(describing: self.userInfo["lipstick"] as! Float)
            case 5:
                cell.textLabel?.text = "Type of skin"
                cell.detailTextLabel?.text = self.userInfo["typeOfSkin"] as? String
            case 6:
                cell.textLabel?.text = "Sensitive to sun"
                cell.detailTextLabel?.text = self.userInfo["sensitiveToSun"] as? String
            case 7:
                cell.textLabel?.text = "Kind of makeup"
                cell.detailTextLabel?.text = self.userInfo["kindOfMakeup"] as? String
            case 8:
                cell.textLabel?.text = "Favourite brand"
                cell.detailTextLabel?.text = self.userInfo["favouriteBrand"] as? String

            default:
                break
            }

        }

        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
