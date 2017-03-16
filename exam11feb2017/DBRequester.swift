//
//  DBRequester.swift
//  exam11feb2017
//
//  Created by Damian Pelovski on 2/11/17.
//  Copyright © 2017 Damian Pelovski. All rights reserved.
//

import UIKit

class DBRequester: NSObject {
    
    private var session: URLSession!
    
    static let instance = DBRequester()
    
    var allAnswers = [String:Any?]()

    override init() {
        //initiate a URLSession
        let sessionConfig = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfig, delegate: nil, delegateQueue: nil)
    }
    
    func login(with username: String, password: String, completionHandler: @escaping (_ success: Bool)->()) {
        
        guard let URL = URL(string: "https://softuniswiftexam1.firebaseio.com/fruityloops/users/\(username).json")
            else {return}
        
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if error == nil {
                
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                if statusCode == 200 {
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any?]
                        
                        guard let DBUsername = json["username"] as? String
                            else { completionHandler(false)
                                return}
                        
                        guard let DBPassword = json["password"] as? String
                            else { completionHandler(false)
                                return}
                        
                        if DBUsername == username && DBPassword == password {
                            completionHandler(true)
                            return
                        }
                        
                    } catch {
                    }
                    
                    completionHandler(false)
                }
            } else {
                
                print("URL Session Task Failed: %@", error!.localizedDescription)
            }
            
        })
        task.resume()
        
    }
    
    func createAnswer(data: [String:Any?]) {
        
        let firstName = data["firstName"] as! String
        let lastName = data["lastName"] as! String
        let age = data["age"] as! String
        
        
        
        guard let URL = URL(string: "https://softuniswiftexam1.firebaseio.com/fruityloops/answers/\(firstName + lastName + age).json")
            else {return}
        
        var request = URLRequest(url: URL)
        request.httpMethod = "PUT"
        request.httpBody = try! JSONSerialization.data(withJSONObject: data, options: [])
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if error == nil {
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
            }
            else {
                //Failure
                print("URL Session Task Failed: %@", error!.localizedDescription)
            }
            
            
            
        })
        task.resume()
        
    }
    
    func getAllAnswers() {
        
        guard let URL = URL(string: "https://softuniswiftexam1.firebaseio.com/fruityloops/answers/.json")
            else {return}
        
        var request = URLRequest(url: URL)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            
            if error == nil {
                
                
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("URL Session Task Succeeded: HTTP \(statusCode)")
                
                if statusCode == 200 {
                    
                    do {
                        
                        //try to take the data and transform it into the equavalent to JSON in Swift, in other words a dictionary with String for key and Any for value
                        let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String: Any?]
                        
                        
                        for (key, value) in json {
                            self.allAnswers[key] = (value as! NSDictionary) as! [String : Any?]
                        }
                        
                        
                        
                        DispatchQueue.main.async {
                            NotificationCenter.default.post(name: .DataReloaded, object: self)
                            
                        }
                        
                        
                    } catch {
                    }
                    
                }
            } else {
                //Failure
                print("URL Session Task Failed: %@", error!.localizedDescription)
            }
            
        })
        task.resume()
        
    }



    
}
