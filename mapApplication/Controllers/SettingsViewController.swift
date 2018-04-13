//
//  SettingsViewController.swift
//  mapApplication
//
//  Created by Roman Malasnyak on 4/10/18.
//  Copyright © 2018 Roman Malasnyak. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBAction func clearData(_ sender: UIButton) {
       // UserDefaults.standard.removePersistentDomain(forName: "\(CoordinatesHelper.shared.currentUser)")
        UserDefaults.standard.removeObject(forKey: "\(CoordinatesHelper.shared.currentUser)")
        UserDefaults.standard.synchronize()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func handleLogout(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        UserDefaults.standard.synchronize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func removeAllData() {
        
    }

}
