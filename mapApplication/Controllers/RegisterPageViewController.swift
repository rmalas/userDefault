//
//  RegisterPageViewController.swift
//  mapApplication
//
//  Created by Roman Malasnyak on 4/6/18.
//  Copyright © 2018 Roman Malasnyak. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {
    
    
    //MARK: Outlets and triggered actions
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBAction func loggingAccountExists(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func registerTapped(_ sender: UIButton) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let repeatPassword = repeatPasswordTextField.text
        
        //check for empty fields
        if ((userPassword?.isEmpty)! || (userEmail?.isEmpty)! || (repeatPassword?.isEmpty)!) {
            displayAlertMessage(thisMessage: "Some fields maybe empty")
        }
        //check for passwords matching
        if(userPassword != repeatPassword) {
            displayAlertMessage(thisMessage: "password missmatch")
        }
        //var usersDict = [UserDefaults.standard.dictionary(forKey: "users")]
        var userDict: [String: String] = [:]
        userDict["email"] = userEmailTextField.text
        userDict["password"] = userPasswordTextField.text
        
        CoordinatesHelper.shared.userList.append(userDict)
        UserDefaults.standard.set(CoordinatesHelper.shared.userList, forKey: "users")
        UserDefaults.standard.synchronize()
        
        let myAlert = UIAlertController(title: "Alert", message: "Registration is successful!", preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    
    func displayAlertMessage(thisMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: thisMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
}
