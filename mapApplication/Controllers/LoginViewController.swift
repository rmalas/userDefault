//
//  ViewController.swift
//  mapApplication
//
//  Created by Roman Malasnyak on 4/6/18.
//  Copyright © 2018 Roman Malasnyak. All rights reserved.
//

import UIKit

struct Person {
    let name: String
    let value: String
    
    init?(dict:[String:String]) {
        guard let name = dict.keys.first, let value = dict[name] else { return nil }
        self.name = name
        self.value = value
    }
}

//12312313123оіцру11231231

class LoginViewController: UIViewController {

    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    
        
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userList = UserDefaults.standard.array(forKey: "users") as? UserList
        
        if let _ = userList?.filter({ ($0["email"]) == userEmail && ($0["password"]) == userPassword}).first
        {
         performSegue(withIdentifier: "showMap", sender: self)
        } else {
            self.displayAlertMessage(thisMessage: "Incorrect data or user doesn't exist")
        }
        
//        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
//        let userPasswordStored = UserDefaults.standard.string(forKey: "userPassword")
        
//        if (userEmailStored == userEmail) {
//            if (userPasswordStored == userPassword) {
//                performSegue(withIdentifier: "showMap", sender: self)
//            }
//        }
//        else {
//            self.displayAlertMessage(thisMessage: "Incorrect data or user doesn't exist")
//        }

        UserDefaults.standard.set(true, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
        
        userPasswordTextField.text = ""
        userEmailTextField.text = ""
    }
    
    
    func displayAlertMessage(thisMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: thisMessage, preferredStyle: UIAlertControllerStyle.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    @IBAction func showRegister(_ sender: UIButton) {
        performSegue(withIdentifier: "showRegister", sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let tabCtrl: UITabBarController = segue.destination as! UITabBarController
            let destinationVC = tabCtrl.viewControllers![0] as! MapViewController
            destinationVC.someEmail = userEmailTextField.text!
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        if (isUserLoggedIn) {
            print(UserDefaults.standard.bool(forKey: "isLoggedIn"))
            performSegue(withIdentifier: "showMap", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

