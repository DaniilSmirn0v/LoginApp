//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Даниил Смирнов on 16.02.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Приветствтую, \(userName)!"
    }
}
