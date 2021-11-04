//
//  EmailViewController.swift
//  LoginScreen
//
//  Created by Ant Colony on 3. 11. 2021..
//

import UIKit

class EmailViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    
    var email: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailLabel.text = email
    }


}

